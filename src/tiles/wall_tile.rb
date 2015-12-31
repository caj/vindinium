require_relative 'tile'

class WallTile < Tile
  def initialize *args
    super
    @cost = Float::INFINITY
  end
end
