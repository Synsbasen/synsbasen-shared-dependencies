require 'sidekiq'
require 'sentry-sidekiq'
require 'sidekiq-unique-jobs'
require_relative 'sidekiq_client_middleware'
require_relative 'sidekiq_server_middleware'

unless Rails.env.production?
  Rails.application.executor.wrap do
    Rake::Task['sidekiq:clear'].invoke
  end
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1'),
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }

  config.client_middleware do |chain|
    chain.add SidekiqClientMiddleware
    chain.add SidekiqUniqueJobs::Middleware::Client
  end
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1'),
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }

  config.client_middleware do |chain|
    chain.add SidekiqClientMiddleware
    chain.add SidekiqUniqueJobs::Middleware::Client
  end

  config.server_middleware do |chain|
    chain.add SidekiqServerMiddleware
    chain.add SidekiqUniqueJobs::Middleware::Server
  end

  config.error_handlers << proc do |exception, context|
    Sentry.capture_exception(exception, extra: context)
  end

  SidekiqUniqueJobs::Server.configure(config)
end

SidekiqUniqueJobs.configure do |config|
  config.lock_ttl = 24.hours.to_i
end
