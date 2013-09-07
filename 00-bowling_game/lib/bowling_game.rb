class BowlingGame
  def initialize
    @pins = []
    @frame = -1
    @rolls = 0
  end

  def roll(pins)
    if new_frame?
      @frame += 1
      @pins[@frame] = []
    end
    @pins[@frame] << pins
    @rolls += 1
  end

  def score
    score = 0
    @pins.each_with_index do |pins, frame|
      frame_score = 0
      pins.each { |p| frame_score += p }
      if frame_score == 10
        frame_score += @pins[frame + 1][0]
      end
      score += frame_score
    end
    score
  end

  private
  def new_frame?
    @rolls % 2 == 0
  end
end
