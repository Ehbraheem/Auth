# frozen_string_literal: true

require_relative '../endpoint'

module Auth
  class App
    class Endpoint
      class Roles < Endpoint
        before(%r{/\b(?=([-_a-z0-9]*)\b)\1}) do |id|
          @role = role(id)
        end

        get '/' do
          @roles = Auth::App::Model::Role.all
          render @roles
        end

        get '/:id' do
          render @role
        end

        post '/' do
          Auth::App::Model::Role.create(params['role']).to_json
        end

        put '/:id' do
          render @role if @role.update payload
          # Auth::App::Model::Role.find(id).update(params['role']).to_json
        end

        delete '/:id' do
          @role.destroy
        end

        private

        def role(id)
          Auth::App::Model::Role.find(id)
        end

        def render(data)
          Auth::App::Render::Role.render data
        end

        def payload
          JSON.parse request.body.read
        end
      end
    end
  end
end
