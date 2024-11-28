# frozen_string_literal: true
require 'rails'
require 'pg'
require 'puma'
require 'redis'
require 'pundit'
require 'sidekiq'
require 'sidekiq-unique-jobs'
require 'sentry-ruby'
require 'sentry-rails'
require 'sentry-sidekiq'
require 'prometheus_exporter'
require 'listen'
require 'ransack'
require 'slim'
require 'slim-rails'
require 'sassc-rails'
require 'autoprefixer-rails'
require 'jsbundling-rails'
require 'cssbundling-rails'
require 'redcarpet'
require 'paranoia'
require 'slack-ruby-client'

require_relative "synsbasen_shared_dependencies/railtie" if defined?(Rails)
require_relative "synsbasen_shared_dependencies/version"

# Load all Rake tasks in the tasks folder and subfolders
if defined?(Rake)
  # This pattern ensures it loads .rake files from subdirectories as well
  Dir.glob(File.expand_path('tasks/**/*.rake', __dir__)).each do |task_file|
    load task_file
  end
end
