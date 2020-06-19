# frozen_string_literal: true

require 'publisher'
require 'initial_roles'

class OnboardingController < ApplicationController
  def init_company
    required_params = %i[company_id email first_name last_name phone]
    allowed_params = params.permit(*required_params)

    missing_params = required_params - allowed_params.keys.map(&:to_sym)

    raise "Missing parameters: #{missing_params}" if missing_params.any?

    create_groups(allowed_params[:company_id])
    create_initial_user(allowed_params.except(:company_id))

    #TODO: does this work?
    initial_user = find_and_wait do
      RippleKeycloak::User.find_by(field: 'username', value: allowed_params[:email])
    end

    assign_initial_user_roles(initial_user['id'], InitialRoles.admin)
    assign_user_to_admin_group(initial_user['id'], allowed_params[:company_id])
  end

  private

  def create_groups(company_id)
    headers = {
      action: :create,
      object_type: :group
    }
    Publisher.publish(headers: headers, body: { name: company_id })
    Publisher.publish(headers: headers, body: { name: "#{company_id}.admin", parent: company_id })
    Publisher.publish(headers: headers, body: { name: "#{company_id}.user", parent: company_id })
  end

  def create_initial_user(body)
    Publisher.publish(
      body: body,
      headers: {
        action: :create,
        object_type: :user
      }
    )
  end

  def assign_initial_user_roles(user_id, role_template)
    headers = {
      action: :add_role,
      object_type: :user
    }
    body = {
      user_id: user_id
    }
    role_template.each do |object_type, actions|
      actions.each do |action|
        role_name = "#{object_type}##{action}"
        Publisher.publish(headers: headers, body: body.merge(role_name: role_name))
      end
    end
  end

  def assign_user_to_admin_group(user_id, company_id)
    headers = {
      action: :add_to_group,
      object_type: :user
    }
    group = nil
    while group.nil?
      begin
        parent_group = RippleKeycloak::Group.find_by(field: 'name', value: company_id)
        parent_group['subGroups'].each do |subgroup|
          group = subgroup if subgroup['name'] == "#{company_id}.admin"
        end
      rescue RippleKeycloak::NotFoundError => _e
        sleep 0.1
      end
    end
    body = {
      user_id: user_id,
      group_id: group['id']
    }
    Publisher.publish(headers: headers, body: body)
  end

  def find_and_wait(&block)
    found = nil
    while initial_user.nil?
      begin
        found = yield
      rescue RippleKeycloak::NotFoundError => _e
        found = nil
        sleep 0.1
      end
    end
    found
  end
end
