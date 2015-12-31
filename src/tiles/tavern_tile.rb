require_relative 'tile'

class TavernTile < Tile
  def initialize *args
    super
    @cost = 1_000_000_000_000_000
  end
end
