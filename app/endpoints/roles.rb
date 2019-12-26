# frozen_string_literal: true

#  #
module Auth
  #  #
  module Api
    #  #
    class Roles < Sinatra::Base
      include Auth::Endpoint

      get '/' do
        Role.all.to_json
      end
    end
  end
end
