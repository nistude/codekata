class BowlingGame
  def initialize
    @pins = 0
  end

  def roll(pins)
    @pins += pins
  end

  def score
    @pins
  end
end
