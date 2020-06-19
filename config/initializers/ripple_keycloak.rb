# frozen_string_literal: true

RippleKeycloak::Client.configure do |c|
  c.base_url = ENV.fetch('KEYCLOAK_BASE_URL')
  c.realm = ENV.fetch('KEYCLOAK_REALM')
  c.client_id = ENV.fetch('KEYCLOAK_CLIENT_ID')
  c.client_secret = ENV.fetch('KEYCLOAK_CLIENT_SECRET')
end
