# frozen_string_literal: true

module Auth
  class App
    require_relative 'app/base'
    require_relative 'app/endpoint'
    require_relative 'app/render'
    require_relative 'app/model'
    require_relative 'app/parser'

    attr_reader :app

    def initialize
      @app = Rack::Builder.app do
        Endpoint.subclasses.each do |e|
          map(e.prefix) { run(e.new) }
        end
      end
    end

    def call(env)
      app.call(env)
    end
  end
end
