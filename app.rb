# frozen_string_literal: true

#   #
class AuthApi < Sinatra::Base
  puts Mongoid.default_client.database_names
  get '/' do
    { welcome: 'This is an authn/authz service.' }.to_json
  end
end
