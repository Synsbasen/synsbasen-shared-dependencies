require 'sidekiq/api'

class SidekiqClientMiddleware
  include Sidekiq::ClientMiddleware

  def call(klass, job, queue, redis_pool)
    position_in_queue = Sidekiq::Queue.new(queue).size + 1
    if position_in_queue > 1
      SynsbasenSlack::Wrapper.new.chat_postMessage(text: "`Sidekiq`: #{klass} added to queue *#{queue}* in position ##{position_in_queue}.").call if job['trigger_slack_notifications']
    end
    yield
  end
end
