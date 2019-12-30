# frozen_string_literal: true

require_relative '../parser'
require_relative '../render'

module Auth
  class App
    module Render
      class Base
        class << self
          def render(data)
            data = data.respond_to?(:map) ? data.map(&:to_hash) : data.to_hash
            Parser.dump data
          end
        end
      end
    end
  end
end
