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
        roll_strike
        game.roll(3)
        game.roll(3)
        17.times { game.roll(0) }

        expect(game.score).to eq 22
      end

      it 'handles bonus balls at the end of the game properly' do
        18.times { game.roll(0) }
        3.times { roll_strike }

        expect(game.score).to eq 30
      end
    end
  end

  describe 'integration tests' do
    it 'counts all strikes correctly' do
      12.times { roll_strike }

      expect(game.score).to eq 300
    end

    it 'counts all spares correctly' do
      10.times { roll_spare }
      game.roll(5)

      expect(game.score).to eq 150
    end

    it 'just adds pins when there are no strikes or spares' do
      10.times { game.roll(9); game.roll(0) }

      expect(game.score).to eq 90
    end
  end

  def roll_spare
    game.roll(5)
    game.roll(5)
  end

  def roll_strike
    game.roll(10)
  end
end
