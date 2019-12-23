# frozen_string_literal: true

require 'dotenv/load'
require 'sinatra/base'
require 'mongoid'
require_relative './config/environment' # db configurations

#   #
class AuthApi < Sinatra::Base
  get '/' do
    { welcome: 'This is an authn/authz service.' }.to_json
  end
end
