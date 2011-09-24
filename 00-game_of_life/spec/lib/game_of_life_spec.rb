require 'spec_helper'

describe GameOfLife do
  let(:grid) { mock(GameOfLife::Grid) }

  before(:each) do
    grid.stub(:update)
    grid.stub(:print)
    GameOfLife::Grid.stub(:new).and_return(grid)
  end

  describe '#initialize' do
    it 'sets up a grid' do
      GameOfLife::Grid.should_receive(:new)

      GameOfLife.new
    end

    it 'prints the grid' do
      grid.should_receive(:print)

      GameOfLife.new
    end
  end

  describe '#play' do
    let(:game) { GameOfLife.new }
    it 'prints the grid' do
      grid.should_receive(:print).twice

      game.play
    end

    it 'updates the grid' do
      grid.should_receive(:update)

      game.play
    end
  end
end
