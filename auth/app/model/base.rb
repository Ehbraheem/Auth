module Auth
  class App
    module Model
      class Base
        
        # This hook is necessary because mongoid unlike active_record
        #  will persist child class' data to parent collection
        def self.inherited(child)
          child.class_eval do
            include Mongoid::Document

            store_in collection: name[/[^:]+$/].pluralize.downcase
          end
        end
      end
    end
  end
end
