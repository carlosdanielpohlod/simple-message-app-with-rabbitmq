require 'rails_helper'

RSpec.describe Client::Receiver, type: :service do
  bunny_instance = BunnyMock.new
  instance = described_class.new
  
  before do
    allow(Bunny)
      .to receive(:new)
      .and_return(bunny_instance)
  end

  it 'has Client::Base inheritance' do
    expect(described_class).to be < Client::Base
  end

  context '.listen_messages' do

    it 'calls with correct params' do
      expect(instance.queue)
        .to receive(:subscribe)
        .with(manual_ack: false, block: true)

      instance.listen_messages
    end
  end
end
