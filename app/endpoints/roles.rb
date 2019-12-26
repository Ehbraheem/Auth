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

      get '/:id' do |id|
        Role.find(id).to_json
      end

      post '/' do
        Role.create(params['role']).to_json
      end

      put '/:id' do |id|
        Role.find(id).update(params['role']).to_json
      end
    end
  end
end
