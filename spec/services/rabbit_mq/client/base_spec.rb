require 'rails_helper'

RSpec.describe RabbitMq::Client::Base, type: :service do
  bunny_instance = BunnyMock.new

  before do
    allow(RabbitMq::Connection)
      .to receive(:new)
      .and_return(bunny_instance)
  end

  describe '#channel' do
    it 'has a Bunny connection instance' do
      instance = RabbitMq::Client::Base.new

      expect(instance.channel.class).to eq(bunny_instance.start.channel.class)
    end
  end

  describe '#queue' do
    it 'has a Bunny queue instance' do
      expect(RabbitMq::Client::Base.new.queue.class).to eq(bunny_instance.channel.queue.class)
    end

    it 'has correct params' do
      queue = RabbitMq::Client::Base.new.queue

      expect(queue.name).to eq(ENV['DEFAULT_ROUTING_KEY'])
      expect(queue.opts[:durable]).to eq(true)
    end
  end
end
