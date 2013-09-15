class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    game_score, roll = 0, 0
    frame = 1
    while frame <= 10 do
      first_roll = @rolls[roll]
      second_roll = @rolls[roll + 1] || 0

      if strike?(first_roll)
        frame_score = first_roll
        frame_score += @rolls[roll + 1]
        frame_score += @rolls[roll + 2]
        roll += 1
      elsif spare?(first_roll, second_roll)
        frame_score = first_roll + second_roll
        frame_score += @rolls[roll + 2]
        roll += 2
      else
        frame_score = first_roll + second_roll
        roll += 2
      end
      game_score += frame_score

      frame += 1
    end
    game_score
  end

  private
  def strike?(first_roll)
    first_roll == 10
  end

  def spare?(first_roll, second_roll)
    first_roll + second_roll == 10
  end
end
