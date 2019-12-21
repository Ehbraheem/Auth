Sinatra::Base.configure :production, :development, :test do

  # Bootstrap MongoDB connection
  Mongoid.load! "./config/mongoid.yml"  # we are running this method from top-level
end
