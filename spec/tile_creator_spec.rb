require 'spec_helper'

describe TileCreator do
  let(:valid_strs) { %w(## [] @1 @2 @3 @4 $- $1 $2 $3 $4) << '  ' }
  let(:text2class) do
    Hash.new do |h, k|
      case k
      when /(  )/ then h[k] = OpenTile
      when /(@[1234])/ then h[k] = OpenTile
      when /(##)/ then h[k] = WallTile
      when /(\$[\-1234])/ then h[k] = MineTile
      when /(\[\])/ then h[k] = TavernTile
      end
    end
  end

  describe '#create' do
    context 'valid args' do
      it "creates a new tile object of the proper type" do
        valid_strs.each do |s|
          created = TileCreator.create(s)
          expect(created.text).to eq(s)
          expect(created.class).to be text2class[created.text]
        end
      end
    end

    context 'invalid args' do
      it 'creates a default Tile' do
        expect(TileCreator.create('bad text').class).to be Tile
      end
    end
  end
end
