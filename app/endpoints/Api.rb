# frozen_string_literal: true

require_relative 'endpoint'
#  #
module Auth
  #  #
  module Api
    # def self.class_added(klass)
    #   klass < Sinatra::Base
    #   klass.include Auth::Endpoint
    # end
    # #  #
    # class ::Class
    #   alias_method :old_inherited, :inherited

    #   def inherited(subclass)
    #     Api.class_added(subclass) if /^Api::\w+/.match subclass.name
    #     old_inherited(subclass)
    #   end

    #   # def self.included(base)
    #   #   base.extend Sinatra::Base
    #   # end
    # end
  end
end
