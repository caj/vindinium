class TileCreator
  class << self
    def create str, x=0, y=0
      case str
      when /(  )/ then OpenTile.new $1, x, y
      when /(@[1234])/ then OpenTile.new $1, x, y
      when /(##)/ then WallTile.new $1, x, y
      when /(\$[\-1234])/ then MineTile.new $1, x, y
      when /(\[\])/ then TavernTile.new $1, x, y
      else Tile.new $1, x, y
      end
    end
  end
end
