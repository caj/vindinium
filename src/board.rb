class Board
  def initialize state
    @state = state
    @size = @state.game.board.size!
    @tile_strs = make_tile_strs @state.game.board.tiles
  end

  private

  def make_tile_strs longstr
    longstr = longstr.split(/(..)/).to_a.inject([[]]) do |acc, x|
      if x == ''
        acc
      elsif acc.last.length == @size
        acc << [x]
      else
        acc.tap { |obj| obj.last << x }
      end
    end.transpose
  end
end
