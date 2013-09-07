class BowlingGame
  def roll(pins)
    @pins = pins
  end

  def score
    @pins || 0
  end
end
