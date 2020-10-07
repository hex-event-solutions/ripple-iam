# frozen_string_literal: true

desc 'Creates base SSO roles'
task create_sso_roles: [:environment] do
  require 'publisher'

  resources = %w[
    accessory
    asset_case
    asset_type_category
    asset_type_maintenance_schedule
    asset_type_multiplier_type
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
    event_item
    image
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

  headers = {
    action: :create,
    object_type: :role
  }

  resources.each do |resource|
    actions.each do |action|
      body = {
        name: "#{resource}##{action}"
      }
      Publisher.publish(body: body, headers: headers)
    end
  end

  Publisher.publish(headers: headers, body: { name: 'document#generate' })
  Publisher.publish(headers: headers, body: { name: 'image#upload' })
end
