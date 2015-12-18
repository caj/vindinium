require 'spec_helper'

describe Client do
  let(:good_args) { { key: ENV['VINDINIUM_KEY'], mode: 'training', turns: 2 } }

  it 'has a @base_url' do
    expect(Client.new.base_url).to include "http"
  end

  describe '#start' do
    context 'with good args' do
      it 'starts a training game' do
        expect(Client.new.start.last_response.game).not_to be_nil
      end
    end

    context 'with bad args' do
      let(:args) do
        good_args.inject([]) { |acc, (h, k)| sub = good_args.dup; sub.delete h; acc.push(sub) }
      end

        it 'raises an error' do
        expect { Client.new.start(args[0]) }.to raise_error /Parse error\. Raw:/
        expect { Client.new.start(args[1]) }.to raise_error /args\[:mode\] should be/
        # args[2] is valid
      end
    end
  end

  describe '#play' do
    context 'with good args' do
      it "continuously sends requests until @raw_response says we're finished" do
        expect(Client.new.start(good_args).play.raw_response).to match /Vindinium - The game is finished/
      end
    end
  end
end
