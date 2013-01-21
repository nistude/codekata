# decides if we won the game or lost
class RobozzleVerifier
  def initialize(stars, max_moves)
    @stars = stars
    @max_moves = max_moves
  end

  def verify(move)
    return false if move.count > @max_moves

    @stars.each do |star|
      return false unless move.passes?(star)
    end

    true
  end
end
