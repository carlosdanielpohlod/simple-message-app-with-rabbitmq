require 'rails_helper'

RSpec.describe RabbitMq::Client::Receiver, type: :service do
  bunny_instance = BunnyMock.new
  
  before do
    allow(Bunny)
      .to receive(:new)
      .and_return(bunny_instance)
  end
  
  it 'has Client::Base inheritance' do
    expect(described_class).to be < RabbitMq::Client::Base
  end

  context '.listen_messages' do

    it 'calls with correct params' do
      instance = described_class.new
      expect(instance.queue)
        .to receive(:subscribe)
        .with(manual_ack: false, block: true)

      instance.listen_messages
    end

    it 'listen and remove sent messages from the queue' do
      instance = described_class.new
      
      instance.queue.publish 'foo'
      instance.listen_messages
      
      expect(instance.queue.message_count).to eq(0)
    end
  end
end
