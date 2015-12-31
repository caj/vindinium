require_relative 'tile'

class MineTile < Tile
  def initialize *args
    super
    @cost = 1_000_000_000_000_000
  end
end
