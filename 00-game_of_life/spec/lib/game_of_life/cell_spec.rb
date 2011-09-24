require 'spec_helper'

describe GameOfLife::Cell do
  let(:cell) { GameOfLife::Cell.new }

  describe '#initialize' do
    it 'sets the cell dead or alive randomly' do
      Kernel.should_receive(:rand).with(2).and_return(1, 0)

      cell1 = GameOfLife::Cell.new
      cell1.alive?.should be_true

      cell2 = GameOfLife::Cell.new
      cell2.alive?.should be_false
    end
  end

  describe '#neighbours_alive' do
    it 'returns 0 for a cell without neighbours' do
      cell.neighbours_alive.should == 0
    end

    it 'returns 0 for a cell with one neighbour that`s dead' do
      cell1 = GameOfLife::Cell.new
      cell1.kill
      cell.add_neighbour(cell1)

      cell.neighbours_alive.should == 0
    end

    it 'returns 1 for a cell with one neighbour that`s alive' do
      cell1 = GameOfLife::Cell.new
      cell1.resurrect
      cell.add_neighbour(cell1)

      cell.neighbours_alive.should == 1
    end

    it 'returns 2 for a cell with two neighbours that are alive' do
      cell1 = GameOfLife::Cell.new
      cell1.resurrect
      cell.add_neighbour(cell1)
      cell2 = GameOfLife::Cell.new
      cell2.resurrect
      cell.add_neighbour(cell2)

      cell.neighbours_alive.should == 2
    end
  end

  describe '#print' do
    it 'prints an X for a living cell' do
      cell.resurrect

      buffer = capture_stdout { cell.print }

      buffer.should == 'X'
    end

    it 'prints a space for a dead cell' do
      cell.kill

      buffer = capture_stdout { cell.print }

      buffer.should == ' '
    end
  end
end
