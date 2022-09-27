class Client::Base
  attr_reader :queue, :channel, :routing_key

  def initialize
    @routing_key = 'default'
    @channel = connection.channel
    @queue = @channel.queue(routing_key, durable: true)
  end
  
  def close_connection
    connection.close
  end

  private

  attr_reader :connection

  def connection
    @connection ||= Connection::Base.new.start
  end
end
