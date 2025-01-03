require "slack-ruby-client"

module SynsbasenSlack
  class Wrapper
    attr_accessor :client, :thread_id

    def initialize
      @client = Slack::Web::Client.new(token: SynsbasenSlack.config[:slack_access_token])
    end

    def chat_postMessage(*args)
      if SynsbasenSlack.config[:disabled]
        Rails.logger.info 'SynsbasenSlack is disabled. Not sending Slack message ..'
        return
      end

      args[0][:channel] ||= SynsbasenSlack.config[:slack_default_channel]
      args[0][:thread_ts] ||= @thread_id

      Rails.logger.info "Sending Slack message: #{args}"
      response = @client.chat_postMessage(*args)
      @thread_id ||= response['ts']

      response
    end
  end
end
