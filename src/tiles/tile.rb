class Tile
  attr_accessor :text, :x, :y, :cost
  attr_writer :north, :south, :east, :west

  def initialize str, x=0, y=0
    @text = str
    @x = x
    @y = y
    @north = @east = @south = @west = nil
    @cost = 100
  end

  def north
    @north || FalseTile
  end

  def south
    @south || FalseTile
  end

  def east
    @east  || FalseTile
  end

  def west
    @west  || FalseTile
  end

  def nabes
    [north, south, east, west].reject { |x| x == FalseTile }
  end

  def to_s
    @text
  end

  def inspect short = false
    if short
      return "<#{self.class.name} @text=#{@text} @x=#{@x} @y=#{@y} " +
             "@north=(#{north.x}, #{north.y})#{north.to_s} " +
             "@south=(#{south.x}, #{south.y})#{south.to_s} " +
             "@east=(#{ east.x}, #{ east.y})#{  east.to_s} " +
             "@west=(#{ west.x}, #{ west.y})#{  west.to_s}>"
    end

    "<#{self.class.name} @text=#{@text} @x=#{@x} @y=#{@y}\n" +
      "  @north= #{north.inspect(true)}\n" +
      "  @south= #{south.inspect(true)}\n" +
      "  @east= #{  east.inspect(true)}\n" +
      "  @west= #{  west.inspect(true)}\n" +
      " >"
  end
end

class FalseTile
  class << self
    def x
      -1
    end

    def y
      -1
    end

    def inspect _ = nil
      "FalseTile"
    end
  end
end
