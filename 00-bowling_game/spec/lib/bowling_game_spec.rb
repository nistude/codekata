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
    it 'counts the next roll after the spare as bonus' do
      game.roll(3)
      game.roll(7)
      game.roll(3)
      game.roll(3)

      expect(game.score).to eq 19
    end
  end

  context 'with a strike' do
    it 'counts the next two rolls after the strike as bonus' do
      game.roll(10)
      game.roll(3)
      game.roll(3)
      game.roll(4)

      expect(game.score).to eq 26
    end
  end

  it 'has a score of 300 for all strikes' do
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end

  it 'has a score of 90 for 10 pairs of 9 and miss' do
    10.times { game.roll(9); game.roll(0) }
    expect(game.score).to eq 90
  end

  it 'has a score of 150 for 10 pairs of 5 and spare' do
    10.times { game.roll(5); game.roll(5) }
    game.roll(5)
    expect(game.score).to eq 150
  end
end
