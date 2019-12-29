# frozen_string_literal: true

require_relative 'base'

module Auth
  class App
    module Render
      class Role < Base
        def self.render(obj)
          hash = {
            id: obj.id.to_s,
            name: obj.name,
            uuid: obj.uuid,
            description: obj.description
          }
          hash[:parent] = obj.parent.to_s if obj.parent?

          super hash
        end
      end
    end
  end
end
