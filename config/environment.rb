# frozen_string_literal: true

Sinatra::Base.configure :production, :development, :test do
  # we are running this method from top-level

  # Bootstrap MongoDB connection
  Mongoid.load! './config/mongoid.yml'
end
