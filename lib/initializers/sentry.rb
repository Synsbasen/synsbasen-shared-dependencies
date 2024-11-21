Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN')
  config.environment = ENV.fetch('SENTRY_ENVIRONMENT', Rails.env)
  config.enabled_environments = %w[production staging]
  config.excluded_exceptions += []
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end if Rails.env.production? && ENV['SENTRY_DSN']
