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

    context 'after one roll' do
      it 'returns the number of pins knocked down' do
        game.roll(3)
        expect(game.score).to eq 3
      end
    end

    context 'after two rolls' do
      it 'returns the sum of pins knocked down' do
        game.roll(3)
        game.roll(4)
        expect(game.score).to eq 7
      end
    end
  end
end
