require 'bowling_game'

describe BowlingGame do
  let(:game) { BowlingGame.new }

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
        roll_spare
        game.roll(3)
        17.times { game.roll(0) }

        expect(game.score).to eq 16
      end

      it 'handles bonus balls at the end of the game properly' do
        18.times { game.roll(0) }
        roll_spare
        game.roll(3)

        expect(game.score).to eq 13
      end
    end

    context 'with a strike' do
      it 'counts the two rolls after the strike as bonus' do
        game.roll(10)
        game.roll(3)
        game.roll(3)
        17.times { game.roll(0) }

        expect(game.score).to eq 22
      end

      it 'handles bonus balls at the end of the game properly' do
        18.times { game.roll(0) }
        3.times { game.roll(10) }

        expect(game.score).to eq 30
      end
    end
  end

  def roll_spare
    game.roll(5)
    game.roll(5)
  end
end
