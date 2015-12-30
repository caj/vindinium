class Tile
  attr_accessor :text, :x, :y, :north, :south, :east, :west

  def initialize str, x=0, y=0
    @text = str
    @x = x
    @y = y
    @north = @east = @south = @west = nil
  end

  def nabes
    [@north, @south, @east, @west].reject { |x| x.nil? }
  end
end
