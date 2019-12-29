# frozen_string_literal: true

require_relative '../endpoint'

module Auth
  class App
    class Endpoint
      class Roles < Endpoint
        get '/' do
          Auth::App::Model::Role.all.to_json
        end

        get '/:id' do |id|
          Auth::App::Render::Role.render Auth::App::Model::Role.find(id)
          # Role.find(id).to_json
        end

        post '/' do
          Auth::App::Model::Role.create(params['role']).to_json
        end

        put '/:id' do |id|
          Auth::App::Model::Role.find(id).update(params['role']).to_json
        end

        delete '/:id' do |id|
          Auth::App::Model::Role.find(id).destroy
        end
      end
    end
  end
end
