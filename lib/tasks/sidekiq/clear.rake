require "sidekiq/api"

namespace :sidekiq do
  desc "Clear all Sidekiq queues"
  task :clear do
    # Loop through all the queues
    Sidekiq::Queue.all.each do |queue|
      puts "Clearing queue: #{queue.name}"
      queue.clear  # This clears the entire queue
    end

    # Clear retries and scheduled jobs as well
    Sidekiq::RetrySet.new.clear
    Sidekiq::ScheduledSet.new.clear

    puts "All queues, retries, and scheduled jobs have been cleared."
  end
end
