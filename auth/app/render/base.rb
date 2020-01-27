# frozen_string_literal: true

require_relative '../parser'
require_relative '../render'

module Auth
  class App
    module Render
      class Base
        class << self
          def render(resource:, status: 200, headers: nil)
            unless resource.is_a?(Hash)
              resource = resource.respond_to?(:map) ? resource.map(&:to_h) : resource.to_h
            end
            body = Parser.dump resource

            [status, headers, body]
          end
        end
      end
    end
  end
end
