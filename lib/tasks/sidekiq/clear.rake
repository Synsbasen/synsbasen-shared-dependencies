require "sidekiq/api"

namespace :sidekiq do
  desc "Clear all Sidekiq queues"
  task :clear => :environment do
    if Rails.env.development?
      puts "Clearing all Redis keys..."
      Sidekiq.redis(&:flushdb)
      puts "Redis has been cleared!"
    else
      puts "This task is for development only."
    end
  end
end
