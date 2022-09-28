class Client::Publisher < Client::Base

  def publish_message(msg_payload)
    channel.default_exchange.publish(
      msg_payload, 
      routing_key: ENV['ROUTING_KEY']
    )
    p "published message #{msg_payload}"
  end

end
