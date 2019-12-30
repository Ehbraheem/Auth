# frozen_string_literal: true

require_relative '../parser'
require_relative '../render'

module Auth
  class App
    module Render
      class Base
        class << self
          def render(resource:, status: 200, headers: nil)
            resource = resource.respond_to?(:map) ? resource.map(&:to_h) : resource.to_h
            body = Parser.dump resource

            [status, headers, body]
          end
        end
      end
    end
  end
end
