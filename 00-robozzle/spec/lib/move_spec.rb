require 'spec_helper'
require 'move'

describe Move do
  describe '#passes?' do
    let(:move) { Move.new }

    before(:each) do
      ConvertsActionsToPositions.stub(:call).and_return([[1, 0], [1, 1]])
    end

    context 'when the actions hit the given position' do
      it 'returns true' do
        expect(move.passes?([1, 1])).to be_true
      end
    end

    context 'when the actions miss the given position' do
      it 'returns false' do
        expect(move.passes?([0, 1])).to be_false
      end
    end
  end
end
