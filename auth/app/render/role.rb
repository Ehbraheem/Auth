# frozen_string_literal: true

require_relative 'base'

module Auth
  class App
    module Render
      class Role < Base
        def self.render(resource:, status: 200, headers: nil)
          if resource
            super
          else
            [status, headers, resource]
          end
        end
      end
    end
  end
end
