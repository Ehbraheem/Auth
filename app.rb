# frozen_string_literal: true

#   #
class AuthApi < Sinatra::Base
  get '/' do
    { welcome: 'This is an authn/authz service.' }.to_json
  end
end
