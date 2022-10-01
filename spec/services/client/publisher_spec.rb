require 'rails_helper'

RSpec.describe Client::Publisher, type: :service do
  bunny_instance = BunnyMock.new

  before do
    allow(Bunny)
      .to receive(:new)
      .and_return(bunny_instance)
  end

  it 'has Client::Base inheritance' do
    expect(described_class).to be < Client::Base
  end

  it 'has an Bunny channel instance' do
    expect(described_class.new.channel.class)
      .to eq(bunny_instance.start.channel.class)
  end

  describe '.publish_message' do

    let(:msg_payload) { double(:message) }
    
    setup do
      ENV['ROUTING_KEY'] = 'foo'
    end

    context 'when passing an message payload' do

      it 'calls default_exchange.publish with correct params' do
        instance = described_class.new

        expect(instance.channel.default_exchange)
          .to receive(:publish)
          .with(
            msg_payload, 
            routing_key: ENV['ROUTING_KEY']
          )

        instance.publish_message(msg_payload)
      end
    end

  end
end 
