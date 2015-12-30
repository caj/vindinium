require_relative 'tile_creator'

class Board
  attr_reader :state, :size, :tile_strs, :tiles

  def initialize state
    @state = state
    @size = @state.game.board.size!
    @tile_strs = make_tile_strs @state.game.board.tiles
    @tiles = make_tiles @tile_strs
    puts "Tiles done. #{@tiles.length}"
  end

  private

  def make_tile_strs longstr
    longstr = longstr.split(/(..)/).to_a.inject([[]]) do |acc, x|
      if x == ''
        acc
      elsif acc.last.length == @size
        acc << [x]
      else
        acc.tap { |obj| obj.last << x }
      end
    end.transpose
  end

  def make_tiles tile_str_array
    tiles = []

    xyloop(tile_str_array) do |str, x, y|
      t = TileCreator.create(str, x, y)

      unless x == 0
        tiles.last.east = t
        t.west = tiles.last
      end

      unless y == 0
        one_above = tiles[xy2idx(x, y-1)]
        t.north = one_above
        one_above.south = t
      end
      tiles << t
    end
    tiles
  end

  def xyloop arr
    arr.each_with_index do |row, y|
      row.each_with_index do |obj, x|
        yield obj, x, y
      end
    end
  end

  def idx2xy idx
    [idx % @size, idx / size]
  end

  def xy2idx x, y
    x + (y * @size)
  end
end
