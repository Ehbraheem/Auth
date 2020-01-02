# frozen_string_literal: true

require_relative 'render'
module Auth
  class App
    class Base < Sinatra::Base
      before do
        content_type 'application/json'
      end

      error Mongoid::Errors::DocumentNotFound do
        render resource: { error: 'NOT FOUND' }, status: 404
      end

      configure :development do
        set :show_exceptions, :after_handler
        enable :dump_errors
      end

      private

      def render(resource:, status: 200, headers: nil)
        Auth::App::Render::Base.render(
          resource: resource, status: status, headers: headers
        )
      end
    end
  end
end
