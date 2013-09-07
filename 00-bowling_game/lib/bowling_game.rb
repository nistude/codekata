class BowlingGame
  def initialize
    @frames = []
    @current_frame = -1
    @rolls = -1
  end

  def roll(pins)
    @rolls += 1
    setup_new_frame if new_frame?
    @frames[@current_frame] << pins
  end

  def score
    game_score = 0
    @frames.each_with_index do |frame, index|
      game_score += frame_score(frame, index)
    end
    game_score
  end

  private
  def new_frame?
    @rolls % 2 == 0
  end

  def setup_new_frame
    @current_frame += 1
    @frames[@current_frame] = []
  end

  def frame_score(frame, index)
    @frame_score = 0
    frame.each { |pins| @frame_score += pins }
    if spare?
      @frame_score += @frames[index + 1][0]
    end
    @frame_score
  end

  def spare?
    @frame_score == 10
  end
end
