require 'spec_helper'

describe Tile do
  it 'is initializable' do
    expect(Tile.new).not_to be_nil
  end

  describe '#text' do
    it 'is equal to what it was initialized with' do
      expect(Tile.new('abc').text).to eq 'abc'
    end
  end

  describe '#x' do
    it 'defaults to 0' do
      expect(Tile.new.x).to be 0
    end

    it 'is otherwise what the tile was instantiated with' do
      expect(Tile.new('##', 999).x).to be 999
    end
  end

  describe '#y' do
    it 'defaults to 0' do
      expect(Tile.new.y).to be 0
    end

    it 'is otherwise what the tile was instantiated with' do
      expect(Tile.new('##', 999, 123).y).to be 123
    end
  end

  describe '#cost' do
    it 'defaults to 100' do
      expect(Tile.new.cost).to be 100
    end

    it 'is writable' do
      t = Tile.new
      expect { t.cost=1000 }.to change { t.cost }.from(100).to 1000
    end
  end

  describe '#nabes' do
    it 'is an array of [@north, @south, @east, @west], minus the nils' do
      t = Tile.new 'tile'
      n = Tile.new 'north'
      s = Tile.new 'south'
      e = Tile.new 'east'
      w = Tile.new 'west'

      t.north = n; t.south = s; t.east = e; t.west = w
      expect(t.nabes).to eq [n, s, e, w]

      t.north = nil
      expect(t.nabes.length).to be 3
      expect(t.north).to be FalseTile
    end
  end

  %w(north south east west).each do |dir|
    describe "##{dir}" do
      let(:t) { Tile.new }
      it 'returns the FalseTile class if nil/unset/false' do
        expect(t.send dir).to be FalseTile
      end

      it 'returns whatever truthy value set to it' do
        t.send "#{dir}=", 'anything'
        expect(t.send dir).to eq 'anything'

        dir_tile = Tile.new
        t.send "#{dir}=", dir_tile
        expect(t.send dir).to be dir_tile
      end
    end
  end
end
