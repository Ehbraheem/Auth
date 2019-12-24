# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'

Bundler.require :default, ENV['RACK_ENV'].to_sym

Sinatra::Base.configure :production, :development, :test do
  # we are running this method from top-level

  # Bootstrap MongoDB connection
  Mongoid.load! './config/mongoid.yml'
end
