class Client::Publisher < Client::Base

  def publish_message(msg_payload)
    channel.default_exchange.publish(
      msg_payload, 
      routing_key: routing_key
    )
    p "published message #{msg_payload}"
  end

  private

  attr_accessor :channel, :routing_key
end
