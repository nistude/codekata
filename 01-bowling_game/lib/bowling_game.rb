class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    game_score = 0
    frame = 1
    i = 0
    while frame <= 10 do
      pins = @rolls[i]
      if pins == 10
        frame_score = pins
        frame_score += @rolls[i + 1]
        frame_score += @rolls[i + 2]
        frame += 1
        i += 1
      elsif pins + @rolls[i + 1] == 10
        frame_score = pins + @rolls[i + 1]
        frame_score += @rolls[i + 2]
        frame += 1
        i += 2
      else
        frame_score = pins + @rolls[i + 1]
        frame += 1
        i += 2
      end
      game_score += frame_score
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
