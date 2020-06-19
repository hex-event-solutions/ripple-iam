# frozen_string_literal: true

require 'ripple_keycloak/group'

class GroupController < ApplicationController
  def index
    groups = []
    allowed_groups.each do |grp|
      groups << RippleKeycloak::Group.find_by(field: 'name', value: grp)
    end

    render json: groups
  end

  # def show
  #   allowed_params = params.permit(:id)

  #   if allowed_groups.include? allowed_params[:id]
  #     render json: RippleKeycloak::Group.find(allowed_params[:id])
  #   else
  #     render status: :forbidden
  #   end
  # end

  private

  def allowed_groups
    trimmed_groups = []
    request.env['keycloak.user_groups'].each do |grp|
      trimmed_groups << grp.split('.')[0]
    end
    trimmed_groups.uniq
  end
end
