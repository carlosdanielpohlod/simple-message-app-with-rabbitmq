require 'rails_helper'

RSpec.describe RabbitMq::Client::Publisher, type: :service do
  bunny_instance = BunnyMock.new

  before do
    allow(Bunny)
      .to receive(:new)
      .and_return(bunny_instance)
  end

  it 'has Client::Base inheritance' do
    expect(described_class).to be < RabbitMq::Client::Base
  end

  it 'has a Bunny channel instance' do
    expect(described_class.new.channel.class)
      .to eq(bunny_instance.start.channel.class)
  end

  describe '.publish_message' do
    let(:msg_payload) { double(:message) }

    setup do
      ENV['DEFAULT_ROUTING_KEY'] = 'foo'
    end

    it 'calls queue.publish with correct params' do
      instance = described_class.new

      expect(instance.queue)
        .to receive(:publish)
        .with(
          msg_payload,
          routing_key: ENV['DEFAULT_ROUTING_KEY']
        )

      instance.publish_message(msg_payload)
    end

    it 'add the message to the queue' do
      instance = described_class.new
      instance.publish_message 'foo'

      expect(instance.queue.message_count).to eq(1)
    end
  end
end
