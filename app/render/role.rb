# frozen_string_literal: true

require_relative 'base'

module Auth
  class App
    module Render
      class Role < Base
        def self.render(data)
          # Not doing anything serious in the moment
          # data = data.map(&:to_hash) if data.respond_to?(:map) || data
          super
        end
      end
    end
  end
end
