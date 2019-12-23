workers Integer(ENV['WEB_CONCURRENCY'] || 3)
threads_count = Integer(ENV['APP_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup         DefaultRackup
port           ENV['PORT']    || 4567

