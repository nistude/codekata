class GameOfLife
  def initialize
    @grid = GameOfLife::Grid.new(24, 80)
    @grid.print
  end

  def play
    @grid.update
    @grid.print
  end
end

require 'game_of_life/grid'
