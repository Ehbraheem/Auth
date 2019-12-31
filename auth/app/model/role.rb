# frozen_string_literal: true

require_relative 'base'

module Auth
  class App
    module Model
      class Role < Base
        # store_in collection: name[/[^:]+$/].pluralize

        field :name, type: String
        field :description, type: String
        field :uuid, type: String
        field :parent, type: BSON::ObjectId

        validates_presence_of :name, :description
  
        before_save do |_doc|
          self.parent = parent.id if parent?
          self.uuid = SecureRandom.uuid unless uuid?
        end

        def to_h
          hash = {
            id: id.to_s,
            name: name,
            description: description,
            uuid: uuid
          }
          hash[:parent] = parent.to_s if parent?
          hash
        end
      end
    end
  end
end
