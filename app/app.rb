# frozen_string_literal: true

module Auth
  class App
    require_relative 'base'
    require_relative 'endpoint'
    require_relative 'render'
    require_relative 'model'
    require_relative 'parser'

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
