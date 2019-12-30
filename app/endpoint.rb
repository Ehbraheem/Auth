# frozen_string_literal: true

require_relative 'base'
require_relative 'parser'

module Auth
  class App
    class Endpoint < Base
      set(:prefix) { "/#{name[/[^:]+$/].downcase}" }

      private

      def payload
        @body ||= Parser.load request.body.read
        puts settings.permitted_params
        if settings.permitted_params?
          @body.slice(*settings.permitted_params)
        else
          @body
        end
      end
    end
  end
end

require_relative 'endpoint/home'
require_relative 'endpoint/roles'
