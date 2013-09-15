require 'bowling_game'

describe BowlingGame do
  let(:game) { BowlingGame.new }

  describe '#roll' do

  end

  describe '#score' do
    it 'returns 0 for the gutter game' do
      20.times { game.roll(0) }
      expect(game.score).to eq 0
    end
  end
end
