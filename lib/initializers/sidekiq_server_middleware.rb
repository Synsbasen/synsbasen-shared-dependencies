require 'sidekiq/api'

class SidekiqServerMiddleware
  include Sidekiq::ServerMiddleware

  def call(worker, job, queue)
    # FIXME: Ideally all workers should have a `slack_wrapper` method, but this is not the case yet.
    slack_wrapper = worker.respond_to?(:slack_wrapper) ? worker.slack_wrapper : SynsbasenSlack::Wrapper.new

    slack_wrapper.chat_postMessage(text: "`Sidekiq`: *#{worker.class.to_s}* started...").call if job['trigger_slack_notifications']
    slack_wrapper.chat_postMessage(text: "```#{JSON.pretty_generate(job)}```").call if job['trigger_slack_notifications']

    begin
      yield
    rescue => e
      # Capture exception in Sentry
      Sentry.capture_exception(e, extra: { job: job, queue: queue, worker: worker.class.to_s })

      # Log the error to Sidekiq's logger
      Sidekiq.logger.error("Worker #{worker.class.to_s} failed: #{e.message}")
      Sidekiq.logger.error(e.backtrace.join("\n"))

      # Notify via Slack
      slack_wrapper.chat_postMessage(text: "`Sidekiq`: *#{worker.class.to_s}* failed with error: #{e.message}").call

      raise e # Re-raise the exception so that Sidekiq knows the job failed
    ensure
      slack_wrapper.chat_postMessage(text: "`Sidekiq`: *#{worker.class.to_s}* stopped...").call if job['trigger_slack_notifications']
    end
  end
end
