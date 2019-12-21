require "sinatra/base"
require "mongoid"
require_relative "./config/environment" # db configurations

class AuthApi < Sinatra::Base
  get "/" do
    "Hello World"
  end
end
