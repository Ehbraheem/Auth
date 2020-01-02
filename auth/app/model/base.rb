# frozen_string_literal: true

module Auth
  class App
    module Model
      class Base
        # This hook is necessary because mongoid unlike active_record
        #  will persist child class' data to parent collection
        def self.inherited(child)
          child.class_eval do
            include Mongoid::Document
            include Mongoid::Timestamps

            Mongoid::QueryCache.enabled = true

            store_in collection: name[/[^:]+$/].pluralize.downcase

            field :active, type: Boolean, default: true

            default_scope -> { where(active: true) }
          end
        end
      end
    end
  end
end
