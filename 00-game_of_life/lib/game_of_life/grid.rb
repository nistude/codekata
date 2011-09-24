require 'game_of_life/cell'

class GameOfLife::Grid
  def initialize(rows, columns)
    @columns = columns
    @rows = rows

    setup_grid
    setup_relationships
  end

  def print
    puts "\e[H\e[2J"
    @cells.each do |row|
      row.each do |cell|
        cell.print
      end
      puts
    end
  end

  def update
    @cells.each do |row|
      row.each do |cell|
        neighbours = cell.neighbours_alive
        if cell.alive?
          if neighbours < 2 || neighbours > 3
            cell.kill
          end
        else
          if neighbours == 3
            cell.resurrect
          end
        end
      end
    end

    @cells.each do |row|
      row.each do |cell|
        cell.sync_neighbours
      end
    end
  end

  private

  def above_is_valid(row)
    row - 1 >= 0
  end

  def below_is_valid(row)
    row + 1 < @rows
  end

  def left_is_valid(column)
    column - 1 >= 0
  end

  def right_is_valid(column)
    column + 1 < @columns
  end

  def setup_grid
    @cells = []
    for row in 0..(@rows - 1)
      @cells[row] = []
      for column in 0..(@columns - 1)
        @cells[row][column] = GameOfLife::Cell.new
      end
    end
  end

  def setup_relationships
    for row in 0..(@rows - 1)
      for column in 0..(@columns - 1)
        cell = @cells[row][column]
        # origin in upper left hand corner
        left = column - 1
        right = column + 1
        above = row - 1
        below = row + 1
        if left_is_valid(column)
          cell.add_neighbour(@cells[above][left]) if above_is_valid(row)
          cell.add_neighbour(@cells[row][left])
          cell.add_neighbour(@cells[below][left]) if below_is_valid(row)
        end
        # cells to the right
        if right_is_valid(column)
          cell.add_neighbour(@cells[above][right]) if above_is_valid(row)
          cell.add_neighbour(@cells[row][right])
          cell.add_neighbour(@cells[below][right]) if below_is_valid(row)
        end
        cell.add_neighbour(@cells[above][column]) if above_is_valid(row)
        # cell below
        cell.add_neighbour(@cells[below][column]) if below_is_valid(row)
      end
    end
  end
end
