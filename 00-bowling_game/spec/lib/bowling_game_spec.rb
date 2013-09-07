require 'bowling_game'

describe BowlingGame do
  let(:game) { BowlingGame.new }

  describe '#roll' do

  end

  describe '#score' do
    context 'without any rolls' do
      it 'returns 0' do
        expect(game.score).to eq 0
      end
    end
  end
end
