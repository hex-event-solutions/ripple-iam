# frozen_string_literal: true

class InitialRoles
  class << self
    def sysadmin
      {
        accessory: %i[create read update delete],
        asset_case: %i[create read update delete],
        asset_event: %i[create read update delete],
        asset_type_category: %i[create read update delete],
        asset_type_event: %i[create read update delete],
        asset_type_specification: %i[create read update delete],
        asset_type: %i[create read update delete],
        asset: %i[create read update delete],
        audit: %i[create read update delete],
        category: %i[create read update delete],
        client_type: %i[create read update delete],
        client: %i[create read update delete],
        company: %i[create read update delete],
        contact: %i[create read update delete],
        crew: %i[create read update delete],
        document_item: %i[create read update delete],
        document_state_event: %i[create read update delete],
        document_state: %i[create read update delete],
        document_type: %i[create read update delete],
        document_type_field: %i[create read update delete],
        document: %i[create read update delete],
        event: %i[create read update delete],
        maintenance_event: %i[create read update delete],
        maintenance_resolution: %i[create read update delete],
        maintenance_schedule: %i[create read update delete],
        maintenance_type: %i[create read update delete],
        multiplier_type: %i[create read update delete],
        row_item: %i[create read update delete],
        shift: %i[create read update delete],
        specification: %i[create read update delete]
      }
    end

    def admin
      {
        accessory: %i[create read update delete],
        asset_case: %i[create read update delete],
        asset_event: %i[create read update delete],
        asset_type_category: %i[create read update delete],
        asset_type_event: %i[create read update delete],
        asset_type_specification: %i[create read update delete],
        asset_type: %i[create read update delete],
        asset: %i[create read update delete],
        audit: %i[create read update],
        category: %i[create read update delete],
        client_type: %i[create read update delete],
        client: %i[create read update delete],
        company: [:read],
        contact: %i[create read update delete],
        crew: %i[create read update delete],
        document_item: %i[create read update delete],
        document_state_event: %i[create read update delete],
        document_state: %i[create read update delete],
        document_type: %i[create read update delete],
        document_type_field: %i[create read update delete],
        document: %i[create read update delete],
        event: %i[create read update delete],
        maintenance_event: %i[create read update delete],
        maintenance_resolution: %i[create read update delete],
        maintenance_schedule: %i[create read update delete],
        maintenance_type: %i[create read update delete],
        multiplier_type: %i[create read update delete],
        row_item: %i[create read update delete],
        shift: %i[create read update delete],
        specification: %i[create read update delete]
      }
    end

    def management
      {
        accessory: %i[create read update delete],
        asset_case: %i[create read update delete],
        asset_event: %i[create read update delete],
        asset_type_category: %i[create read update delete],
        asset_type_event: %i[create read update delete],
        asset_type_specification: %i[create read update delete],
        asset_type: %i[create read update delete],
        asset: %i[create read update delete],
        audit: [:create],
        category: %i[create read update delete],
        client_type: %i[create read update delete],
        client: %i[create read update delete],
        company: [:read],
        contact: %i[create read update delete],
        crew: %i[create read update delete],
        document_item: %i[create read update delete],
        document_state_event: %i[create read update delete],
        document_state: %i[create read update delete],
        document_type: %i[create read update delete],
        document_type_field: %i[create read update delete],
        document: %i[create read update delete],
        event: %i[create read update delete],
        maintenance_event: %i[create read update delete],
        maintenance_resolution: %i[create read update delete],
        maintenance_schedule: %i[create read update delete],
        maintenance_type: %i[create read update delete],
        multiplier_type: %i[create read update delete],
        row_item: %i[create read update delete],
        shift: %i[create read update delete],
        specification: %i[create read update delete]
      }
    end

    def operations
      {
        accessory: %i[create read update delete],
        asset_case: %i[create read update delete],
        asset_event: %i[create read update delete],
        asset_type_category: %i[create read update delete],
        asset_type_event: %i[create read update delete],
        asset_type_specification: %i[create read update delete],
        asset_type: %i[create read update delete],
        asset: %i[create read update delete],
        audit: [:create],
        category: [:read],
        client_type: [:read],
        client: %i[create read update delete],
        company: [:read],
        contact: %i[create read update delete],
        crew: [:read],
        document_item: %i[create read update delete],
        document_state_event: %i[create read update delete],
        document_state: [:read],
        document_type: [:read],
        document_type_field: [:read],
        document: %i[create read update delete],
        event: %i[create read update delete],
        maintenance_event: %i[create read update delete],
        maintenance_resolution: [:read],
        maintenance_schedule: %i[create read update delete],
        maintenance_type: [:read],
        multiplier_type: %i[create read update delete],
        row_item: %i[create read update delete],
        shift: %i[create read update delete],
        specification: %i[create read update delete]
      }
    end

    def warehouse
      {
        accessory: [:read],
        asset_case: %i[read update],
        asset_event: %i[create read update delete],
        asset_type_category: [:read],
        asset_type_event: [:read],
        asset_type_specification: [:read],
        asset_type: [:read],
        asset: %i[read update],
        audit: [:create],
        category: [:read],
        company: [:read],
        event: [:read],
        maintenance_event: %i[create read update delete],
        maintenance_resolution: [:read],
        maintenance_schedule: [:read],
        maintenance_type: [:read],
        specification: [:read]
      }
    end
  end
end
