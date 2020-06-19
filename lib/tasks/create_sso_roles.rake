# frozen_string_literal: true

desc 'Creates base SSO roles'
task create_sso_roles: [:environment] do
  require 'publisher'

  resources = %w[
    accessory
    asset_case
    asset_event
    asset_type_category
    asset_type_event
    asset_type_specification
    asset_type
    asset
    audit
    category
    client_type
    client
    company
    contact
    crew
    document_item
    document_state_event
    document_state
    document_type
    document_type_field
    document_type
    document
    event
    maintenance_event
    maintenance_resolution
    maintenance_schedule
    maintenance_type
    multiplier_type
    row_item
    shift
    specification
  ]

  actions = %w[create read update delete]

  resources.each do |resource|
    actions.each do |action|
      headers = {
        action: :create,
        object_type: :role
      }
      body = {
        name: "#{resource}##{action}"
      }
      Publisher.publish(body: body, headers: headers)
    end
  end
end
