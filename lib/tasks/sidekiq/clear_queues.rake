require "sidekiq/api"

namespace :sidekiq do
  desc "Clear all Sidekiq queues"
  task clear_queues: :environment do
    puts "Clearing all Sidekiq queues"
    Sidekiq::Queue.all.each(&:clear)
    puts "Done! Cleared all Sidekiq queues"
  end
end
