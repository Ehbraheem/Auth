# frozen_string_literal: true

# Bootstrap MongoDB connection
Mongoid.load! './config/mongoid.yml', ENV['RACK_ENV']
