class GameOfLife::Cell
  attr_reader :neighbours_alive

  def initialize
    if Kernel.rand(2) == 1
      @state = :alive
    else
      @state = :dead
    end

    @neighbours = []
    @neighbours_alive = 0
  end

  def alive?
    @state == :alive
  end

  def add_neighbour(neighbour)
    @neighbours << neighbour
    sync_neighbours
  end

  def sync_neighbours
    @neighbours_alive = 0
    @neighbours.each do |neighbour|
      @neighbours_alive = @neighbours_alive + 1 if neighbour.alive?
    end
  end

  def print
    if @state == :alive
      Kernel.print 'X'
    elsif @state == :dead
      Kernel.print ' '
    end
  end

  def kill
    @state = :dead
  end

  def resurrect
    @state = :alive
  end
end
