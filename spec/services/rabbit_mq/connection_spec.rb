require 'rails_helper'

RSpec.describe RabbitMq::Connection, type: :service do
  bunny_instance = BunnyMock.new
  

  before do
    allow(Bunny)
      .to receive(:new)
      .and_return(bunny_instance)
  end

  it '#connection' do
    expect(described_class.new.connection.class).to eq(bunny_instance.class)
  end

  # it '#channel' do
  #   bunny_with_channel = bunny_instance.start.channel

  #   expect(described_class.new.channel)
  #     .to eq(bunny_with_channel)
  # end
end 
