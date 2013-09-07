class BowlingGame
  def initialize
    @frames = [[]]
    @current_frame = 0
  end

  def roll(pins)
    setup_new_frame if new_frame?
    @frames[@current_frame] << pins
  end

  def score
    game_score = 0
    @frames.each_with_index do |frame, index|
      break if index > 9
      game_score += frame_score(frame, index)
    end
    game_score
  end

  private
  def new_frame?
    @frames[@current_frame].size == 2 ||
      @frames[@current_frame][0] == 10
  end

  def setup_new_frame
    @current_frame += 1
    @frames[@current_frame] = []
  end

  def frame_score(frame, index)
    @frame_score = 0
    frame.each { |pins| @frame_score += pins }
    if strike?(frame)
      @frame_score += @frames[index + 1][0]
      if @frames[index + 1][0] == 10
        @frame_score += @frames[index + 2][0]
      else
        @frame_score += @frames[index + 1][1]
      end
    elsif spare?(frame)
      @frame_score += @frames[index + 1][0]
    end
    @frame_score
  end

  def strike?(frame)
    frame.size == 1 && frame[0] == 10
  end

  def spare?(frame)
    frame.size == 2 && frame[0] + frame[1] == 10
  end
end
