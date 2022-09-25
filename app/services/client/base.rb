class Client::Base
  attr_reader :queue, :channel, :routing_key

  def initialize
    @routing_key = 'default'
    connection = Connection::Base.new.start
    connection.create_channel
    @channel = connection.channel
    @queue = @channel.queue(routing_key, durable: true)
  end
  
  def close_connection
    connection.close
  end
end
