# frozen_string_literal: true

require 'multi_json'
require 'oj'

require_relative '../render'

module Auth
  class App
    module Render
      class Base
        class << self
          def render(hash)
            MultiJson.use :oj
            MultiJson.dump hash
          end
        end
      end
    end
  end
end
