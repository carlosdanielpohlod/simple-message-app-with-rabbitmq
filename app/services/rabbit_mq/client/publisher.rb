class RabbitMq::Client::Publisher < RabbitMq::Client::Base

  def publish_message(msg_payload)
    queue.publish(
      msg_payload, 
      routing_key: ENV['DEFAULT_ROUTING_KEY']
    )
    p "published message #{msg_payload}"
  end

end
