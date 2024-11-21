# frozen_string_literal: true

require_relative "synsbasen_slack/config"
require_relative "synsbasen_slack/wrapper"

# class Railtie < Rails::Railtie
#   initializer 'synsbasen_slack.configure' do
#     Rails.application.reloader.to_prepare do
#       SynsbasenSlack.configure do |config|
#         config.slack_access_token = Rails.env.test? ? 'test_token' : ENV.fetch('SLACK_ACCESS_TOKEN', '')
#         config.slack_default_channel = Rails.env.test? ? 'test_channel' : ENV.fetch('SLACK_DEFAULT_CHANNEL', '')
#         config.disabled = ENV['SLACK_DISABLED'] == 'true'
#       end
#     end
#   end
# end
