require 'spec_helper'
require 'robozzle_verifier'
require 'move'

# knows positions of all stars
require 'forwardable'
class StarPositions
  extend Forwardable
  def_delegators :@stars, :each

  def initialize(*positions)
    @stars = positions
  end
end


describe RobozzleVerifier do
  describe '#verify' do
    let(:move) { double(Move) }
    let(:verifier) { RobozzleVerifier.new(stars, 5) }

    before(:each) do
      move.stub(count: 5)
    end

    context 'with too many moves' do
      let(:stars) { StarPositions.new }

      it 'returns false' do
        move.stub(count: 10)

        expect(verifier.verify(move)).to be_false
      end
    end

    context 'with no stars and no moves' do
      let(:stars) { StarPositions.new }

      it 'returns true' do
        expect(verifier.verify(move)).to be_true
      end
    end

    context 'with one star' do
      let(:stars) { StarPositions.new(:one) }

      context 'and a winning move' do
        it 'returns true' do
          move.stub(:passes? => true)

          expect(verifier.verify(move)).to be_true
        end
      end

      context 'and a loosing move' do
        it 'returns false' do
          move.stub(:passes? => false)

          expect(verifier.verify(move)).to be_false
        end
      end
    end

    context 'with multiple stars' do
      let(:stars) { StarPositions.new(:one, :two, :three) }

      context 'and a winning move' do
        it 'returns true' do
          move.stub(:passes?).with(:one).and_return(true)
          move.stub(:passes?).with(:two).and_return(true)
          move.stub(:passes?).with(:three).and_return(true)

          expect(verifier.verify(move)).to be_true
        end
      end

      context 'and a loosing move' do
        it 'returns false' do
          move.stub(:passes?).with(:one).and_return(true)
          move.stub(:passes?).with(:two).and_return(false)

          expect(verifier.verify(move)).to be_false
        end
      end
    end

    it 'works' do
      stars = StarPositions.new([1, 0], [1, 1], [1, 2])
      verifier = RobozzleVerifier.new(stars, 10)
      move = Move.new(:right, :forward, :left, :forward, :forward)

      expect(verifier.verify(move)).to be_true
    end
  end
end
