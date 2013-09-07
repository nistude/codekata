class BowlingGame
  def initialize
    @frames = []
    @current_frame = -1
    @rolls = 0
  end

  def roll(pins)
    if new_frame?
      @current_frame += 1
      @frames[@current_frame] = []
    end
    @frames[@current_frame] << pins
    @rolls += 1
  end

  def score
    game_score = 0
    @frames.each_with_index do |frame, index|
      @frame_score = 0
      frame.each { |pins| @frame_score += pins }
      if spare?
        @frame_score += @frames[index + 1][0]
      end
      game_score += @frame_score
    end
    game_score
  end

  private
  def new_frame?
    @rolls % 2 == 0
  end

  def spare?
    @frame_score == 10
  end
end
