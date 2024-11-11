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

require_relative "synsbasen_shared_dependencies/version"
require_relative 'synsbasen_shared_dependencies/sidekiq_initializer'

module SynsbasenSharedDependencies
  class Error < StandardError; end
  # Your code goes here...
end
