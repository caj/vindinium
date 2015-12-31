class Tile
  attr_accessor :text, :x, :y
  attr_writer :north, :south, :east, :west, :cost

  def initialize str, x=0, y=0
    @text = str
    @x = x
    @y = y
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

  def cost
    @cost || 100
  end

  def nabes
    [north, south, east, west].reject { |x| x == FalseTile }
  end

  def to_s
    @text
  end

  def inspect short = false
    if short
      return "<#{self.class.name} text=#{@text} x=#{@x} y=#{@y} " +
             "north=(#{north.x}, #{north.y})#{north.to_s} " +
             "south=(#{south.x}, #{south.y})#{south.to_s} " +
             "east=(#{ east.x}, #{ east.y})#{  east.to_s} " +
             "west=(#{ west.x}, #{ west.y})#{  west.to_s}>"
    end

    "<#{self.class.name} text=#{@text} x=#{@x} y=#{@y}\n" +
      "  north= #{north.inspect(true)}\n" +
      "  south= #{south.inspect(true)}\n" +
      "  east= #{  east.inspect(true)}\n" +
      "  west= #{  west.inspect(true)}\n" +
      " >"
  end

  def update new_str
    if @text != new_str
      handle_change_to new_str
      @text = new_str
    end
  end

  private

  def handle_change_to str
    # Implement in subclasses
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
