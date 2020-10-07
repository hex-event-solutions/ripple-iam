# frozen_string_literal: true

require 'json'

class UserController < ApplicationController
  def index
    render json: group_and_subgroup_members(allowed_groups.first)
  end

  def show
    allowed_params = params.permit(:id)
    user_id = allowed_params[:id]

    allowed_users = group_and_subgroup_members(allowed_groups.first)

    render json: allowed_users[user_id]
  end

  def create; end

  def update; end

  def add_to_group; end

  def remove_from_group; end

  def send_email
    allowed_params = params.permit(:user_id, :actions, :lifespan, :client_id, :redirect_uri)
    options = {}
    options[:lifespan] = allowed_params[:lifespan] if allowed_params[:lifespan]
    options[:client_id] = allowed_params[:client_id] if allowed_params[:client_id]
    options[:redirect_uri] = allowed_params[:redirect_uri] if allowed_params[:redirect_uri]

    RippleKeycloak::User.send_email(allowed_params[:user_id], allowed_params[:actions], **options)
  end

  private

  def allowed_groups
    trimmed_groups = []
    request.env['keycloak.user_groups'].each do |grp|
      trimmed_groups << grp[%r{^/([a-z0-9-]+)[./]?}, 1]
    end
    trimmed_groups.uniq
  end

  def group_and_subgroup_members(name)
    group = RippleKeycloak::Group.find_by(field: 'name', value: name)
    group_ids = [group['id'], subgroup_ids(group)].flatten
    members = []
    group_ids.each do |group_id|
      members << RippleKeycloak::Group.members(group_id)
    end
    users = {}
    members.flatten.uniq.each do |member|
      users[member['id']] = member
    end
    users
  end

  def subgroup_ids(group)
    ids = []

    group['subGroups'].each do |subgroup|
      ids << subgroup['id']
      ids << subgroup_ids(subgroup) if subgroup['subGroups'].any?
    end
    ids
  end
end
