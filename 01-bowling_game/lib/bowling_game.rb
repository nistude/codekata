class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    game_score = 0
    (0..9).each do |frame|
      game_score += frame_score(frame)
    end
    game_score
  end

  private
  def frame_score(frame)
    first_roll = @rolls[2 * frame]
    second_roll = @rolls[2 * frame + 1]
    frame_score = first_roll + second_roll

    if spare?(first_roll, second_roll)
      bonus = @rolls[2 * frame + 2]
      frame_score += bonus
    end

    frame_score
  end

  def spare?(*frame)
    frame[0] + frame[1] == 10
  end
end
