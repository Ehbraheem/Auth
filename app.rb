# frozen_string_literal: true

Dir[File.join(__dir__, 'app/**/*.rb')].each do |f|
  require_relative f unless f[%r{^\./spec/}]
end
#  #
module Auth
  #  #
  class Index < Sinatra::Base
    include Auth::Endpoint

    get '/' do
      { welcome: 'This is an authn/authz service.' }.to_json
    end
  end

  #  #
  class App
    attr_reader :app

    def initialize
      @app = Rack::Builder.app do
        map('/') { run Index.new }
        [Api::Roles].each do |e|
          map(e.prefix) { run(e.new) }
        end
      end
    end

    def call(env)
      app.call(env)
    end
  end

  def self.inherited(sublass)
    super
    use sublass 
  end
end
