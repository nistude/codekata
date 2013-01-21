class ConvertsActionsToPositions
  def self.call(origin, direction, actions)
    dir = Direction.new(direction)

    position = origin
    [].tap do |route|
      route << origin
      actions.each do |action|
        case action
        when :forward
          position = dir.forward(position)
          route << position
        when :left then dir.rotate(:left)
        when :right then dir.rotate(:right)
        else
          raise "Action #{action} not implemented."
        end
      end
    end
  end

  class Direction
    def initialize(direction)
      @direction = direction
    end

    def forward(position)
      pos = position.dup
      case @direction
      when :north then pos[1] += 1
      when :east then pos[0] += 1
      when :south then pos[1] -= 1
      when :west then pos[0] -= 1
      end

      pos
    end

    def rotate(direction)
      if direction == :left
        case @direction
        when :north then @direction = :west
        when :east then @direction = :north
        when :south then @direction = :east
        when :west then @direction = :south
        end
      elsif direction == :right
        case @direction
        when :north then @direction = :east
        when :east then @direction = :south
        when :south then @direction = :west
        when :west then @direction = :north
        end
      else
        raise "Direction #{direction} not implemented."
      end
    end
  end
end
