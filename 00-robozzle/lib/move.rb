require 'converts_actions_to_positions'

# knows the moves we made
class Move
  def initialize(*actions)
    @actions = actions
    @direction = :north
    @origin = [0, 0]
  end

  def count
    @actions.count
  end

  def passes?(position)
    positions.include?(position)
  end

  private
  def positions
    @positions ||= ConvertsActionsToPositions.call(@origin, @direction, @actions)
  end
end

