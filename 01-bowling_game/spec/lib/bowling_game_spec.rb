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

    context 'without spares and strikes' do
      it 'returns the sum of all rolls' do
        20.times { game.roll(1) }
        expect(game.score).to eq 20
      end
    end

    context 'with a spare' do
      it 'counts the roll after the spare as a bonus' do
        game.roll(5)
        game.roll(5)
        game.roll(3)
        17.times { game.roll(0) }

        expect(game.score).to eq 16
      end
    end
  end
end
