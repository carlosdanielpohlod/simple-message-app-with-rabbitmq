require 'rails_helper'

RSpec.describe RabbitMq::Connection, type: :service do
  bunny_instance = BunnyMock.new

  before do
    allow(Bunny)
      .to receive(:new)
      .and_return(bunny_instance)
  end

  describe '#connection' do
    it 'have a Bunny connection instance' do
      expect(described_class.new.connection.class).to eq(bunny_instance.class)
    end
  end

  describe '#channel' do
    it 'has a Bunny channel instance' do
      instance_with_channel = described_class.new.start.channel
      bunny_with_channel = bunny_instance.start.channel

      expect(instance_with_channel.class).to eq(bunny_with_channel.class)
    end
  end

  describe '.create_channel' do
    it 'return a Bunny channel instance' do
      result = described_class.new.create_channel

      expect(result.class).to eq(BunnyMock::Channel)
    end
  end

  describe '.close' do
    it 'close the Bunny connection' do
      result = described_class.new
      result.close

      expect(result.connection.status).to eq(:closed)
    end
  end

  describe '.start' do
    it 'start a Bunny connection' do
      result = described_class.new
      result.start

      expect(result.connection.status).to eq(:connected)
    end
  end
end
