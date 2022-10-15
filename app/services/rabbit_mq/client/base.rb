class RabbitMq::Client::Base
  attr_reader :queue, :channel

  def initialize
    @channel = connection.channel
    @queue = @channel.queue(ENV['DEFAULT_ROUTING_KEY'], durable: true)
  end

  private

  def connection
    @connection ||= RabbitMq::Connection.new.start
  end
end
