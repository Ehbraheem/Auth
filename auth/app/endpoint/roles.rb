# frozen_string_literal: true

require_relative '../endpoint'

module Auth
  class App
    class Endpoint
      class Roles < Endpoint
        set :permitted_params, %w[name description parent uuid]

        before(%r{/\b(?=([-_a-z0-9]*)\b)\1}) do |id|
          @role = role(id)
        end

        get '/' do
          @roles = roles
          render resource: @roles
        end

        get '/:id' do
          render(resource: @role) if @role
        end

        post '/' do
          @role = build_role
          @role.save
          render resource: @role, status: 201
        end

        put '/:id' do
          render(resource: @role, status: 204) if @role.update(payload)
        end

        delete '/:id' do
          @role.destroy
        end

        private

        def role(id)
          Auth::App::Model::Role.find(id)
        end

        def build_role
          Auth::App::Model::Role.new payload
        end

        def render(data)
          Auth::App::Render::Role.render data
        end

        def roles
          Auth::App::Model::Role.all
        end
      end
    end
  end
end
