require 'rails_helper'

RSpec.describe Client::Base, type: :service do
  bunny_instance = BunnyMock.new

  before do
    allow(RabbitMq::Connection)
      .to receive(:new)
      .and_return(bunny_instance)
  end

  
  describe '#channel' do
    it 'has an Bunny connection instance' do
      instance = Client::Base.new

      expect(instance.channel.class).to eq(bunny_instance.start.channel.class)
    end
  end

  describe '#queue' do
    it 'have an Bunny class instance' do
      expect(Client::Base.new.queue.class).to eq(bunny_instance.channel.queue.class)
    end

    it 'have correct params' do
      queue = Client::Base.new.queue

      expect(queue.name).to eq(ENV['ROUTING_KEY'])
      expect(queue.opts[:durable]).to eq(true)
    end 
  end 
end 
