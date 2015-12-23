class TileCreator
  class << self
    def create str
      case str
      when /(  )/ then OpenTile.new $1
      when /(@[1234])/ then OpenTile.new $1
      when /(##)/ then WallTile.new $1
      when /(\$[\-1234])/ then MineTile.new $1
      when /(\[\])/ then TavernTile.new $1
      else Tile.new $1
      end
    end
  end
end
