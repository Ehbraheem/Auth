# frozen_string_literal: true

require_relative '../model'

module Auth
  class App
    module Model
      class Role < Base
        # Mongoid::QueryCache.enabled = true
        # store_in collection: name[/[^:]+$/].pluralize

        field :name, type: String
        field :description, type: String
        field :uuid, type: String
        field :parent, type: BSON::ObjectId

        before_save do |_doc|
          self.parent = parent.id if parent?
        end
      end
    end
  end
end
