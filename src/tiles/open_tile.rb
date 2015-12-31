require_relative 'tile'

class OpenTile < Tile
  def cost
    return super unless occupied?
    1_000_000_000_000_000
  end

  def occupied?
    !!@text[1].match(/\d/)
  end
end
