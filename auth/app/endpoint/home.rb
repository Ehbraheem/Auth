# frozen_string_literal: true

require_relative '../endpoint'

module Auth
  class App
    class Endpoint
      class Home < Endpoint
        set(:prefix) { '/' }

        get '/' do
          { welcome: 'This is an authn/authz service.' }.to_json
        end
      end
    end
  end
end
