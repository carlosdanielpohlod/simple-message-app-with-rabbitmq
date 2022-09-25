
class Client::Receiver < Client::Base
  
  def listen_messages
    puts "Consuming messages"
    
    queue.subscribe(manual_ack: false, block: true) do |_, _, payload|
      puts "📢 Received '#{payload}'"
    end
  end

  private

  attr_accessor :queue, :channel
end
