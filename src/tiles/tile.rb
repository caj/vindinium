class Tile
  attr_accessor :text, :x, :y

  def initialize str, x=0, y=0
    @text = str
    @x = x
    @y = y
  end
end
