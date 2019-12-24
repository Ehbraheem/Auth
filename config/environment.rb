# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'

Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative './initializers/mongoid'
Dir[File.join(__dir__, '../app/**/*.rb')].each do |f|
  require_relative f unless f[%r{^\./spec/}]
end
