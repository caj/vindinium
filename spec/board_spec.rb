require 'spec_helper'

describe Board do
  let(:state) { EX_STATE.dup }
  let(:board) { Board.new(state) }

  it 'is initializable' do
    expect(board).not_to be_nil
  end

  describe '#size' do
    it 'is @state.game.board.size' do
      expect(board.size).to eq state.game.board.size!
    end
  end

  describe '#tile_strs' do
    it 'is an array of arrays of 2-character strings, in the shape of the board' do
      expect(board.tile_strs.size).to eq state.game.board.size!
      board.tile_strs.each { |row| expect(row.size).to eq state.game.board.size! }

      sgbt = state.game.board.tiles
      expect(board.tile_strs.first.first).to eq sgbt[0..1]
      expect(board.tile_strs.last.last).to eq sgbt[sgbt.length-2..sgbt.length]
    end
  end

  describe '#tiles' do
    it 'is an array of various subclasses of Tile, representing the map' do
      expect(board.tiles.map { |x| x.class.name }).to all(match(/\w+Tile/))
    end

    it 'has tiles in the correct position' do
      state.game.heroes.each_with_index do |h, i|
        x = h.pos.x
        y = h.pos.y
        t = board.tiles.find { |t| t.x == x && t.y == y }
        expect(t.x).to eq x
        expect(t.y).to eq y
        expect(t.text).to eq "@#{i+1}"
      end
    end

    it "sets the tiles' neighbors properly" do
      # in the map fixture we're using, 3 of the 4 taverns have a hero next to them
      # we skip i == 2 because it's the one that doesnt
      board.tiles.select { |x| x.is_a? TavernTile }.each_with_index do |tavern, i|
        next if i == 2
        hero = tavern.nabes.find { |x| x.text[0] == '@' }
        expect(hero).not_to be_nil
      end

      puts board.tiles.first.inspect
    end
  end
end
