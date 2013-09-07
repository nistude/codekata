require 'bowling_game'

describe BowlingGame do
  let(:game) { BowlingGame.new }

  context 'without any rolls' do
    it 'has a score of 0' do
      expect(game.score).to eq 0
    end
  end

  context 'without spares or strikes' do
    it 'sums all knocked down pins' do
      20.times { game.roll(3) }
      expect(game.score).to eq 60
    end
  end

  context 'with a spare' do
    xit 'counts the roll after the spare as bonus' do
      game.roll(3)
      game.roll(7)
      game.roll(3)
      game.roll(3)

      expect(game.score).to eq 19
    end
  end
end
