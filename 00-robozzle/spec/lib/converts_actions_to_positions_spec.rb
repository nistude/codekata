require 'spec_helper'
require 'converts_actions_to_positions'

describe ConvertsActionsToPositions do
  describe '.call' do
    let(:origin) { [0, 0] }
    let(:direction) { :north }

    context 'with no actions' do
      it 'returns the current position' do
        expect(
          ConvertsActionsToPositions.call(origin, direction, [])
        ).to eq([origin])
      end
    end

    context 'movement' do
      it ':forward moves one step forward' do
        expect(
          ConvertsActionsToPositions.call(origin, direction, [:forward])
        ).to eq([origin, [0, 1]])
      end
    end

    context 'rotation' do
      it ':left rotates left' do
        expect(
          ConvertsActionsToPositions.call(origin, direction, [:left, :forward])
        ).to eq([origin, [-1, 0]])
      end

      it ':right rotates right' do
        expect(
          ConvertsActionsToPositions.call(origin, direction, [:right, :forward])
        ).to eq([origin, [1, 0]])
      end
    end
  end
end
