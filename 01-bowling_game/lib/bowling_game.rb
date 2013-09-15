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
      first = @rolls[2 * frame]
      second = @rolls[2 * frame + 1]
      frame_score = first + second
      if frame_score == 10
        frame_score += @rolls[2 * frame + 2]
      end
      game_score += frame_score
    end
    game_score
  end
end
