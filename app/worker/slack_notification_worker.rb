class SlackNotificationWorker
  include Sidekiq::Worker

  def perform(message)
    webhook = ENV['SLACK_WEBHOOK']
    notifier = Slack::Notifier.new webhook do
      defaults username: 'GuardRobot'
    end

    notifier.post text: message
  end
end
