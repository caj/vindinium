require 'spec_helper'

describe OpenTile do
  describe '#cost' do
    context "when it is empty (@text == '  ')" do
      it 'is the default tile cost' do
        expect(OpenTile.new('  ').cost).to eq Tile.new('  ').cost
      end
    end

    context 'when it is occupied' do
      it 'is a very large finite number' do
        expect(OpenTile.new('@1').cost).to be > 1_000_000_000
      end
    end
  end

  describe '#occupied?' do
    context '@text has a number in its second char' do
      it 'is true' do
        expect(OpenTile.new('@1').occupied?).to be true
      end
    end

    context 'otherwise' do
      it 'is false' do
        expect(OpenTile.new('##').occupied?).to be false
        expect(OpenTile.new('  ').occupied?).to be false
      end
    end
  end
end

