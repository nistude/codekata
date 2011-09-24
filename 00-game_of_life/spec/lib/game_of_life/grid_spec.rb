require 'spec_helper'

describe GameOfLife::Grid do
  let(:cell) { mock(GameOfLife::Cell).as_null_object }
  let(:columns) { 4 }
  let(:rows) { 3 }

  describe '#initialize' do
    it 'sets up a grid of given size' do
      GameOfLife::Cell.should_receive(:new).exactly(rows * columns).times.and_return(cell)

      GameOfLife::Grid.new(rows, columns)
    end

    context 'when adding neighbour cells' do
      before(:each) do
        @neighbour = GameOfLife::Cell.new
        @cell = GameOfLife::Cell.new
      end

      it 'adds no neighbour to a single cell' do
        GameOfLife::Cell.stub(:new).and_return(cell)
        cell.should_not_receive(:add_neighbour)

        grid = GameOfLife::Grid.new(1, 1)
      end

      it 'adds an adjacent cell on the right as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(cell, @neighbour)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(1, 2)
      end

      it 'adds an adjacent cell on the left as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(@neighbour, cell)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(1, 2)
      end

      it 'adds both adjacent cells on the same row as neighbours' do
        GameOfLife::Cell.stub(:new).and_return(@neighbour, cell, @cell)
        cell.should_receive(:add_neighbour).with(@neighbour).once
        cell.should_receive(:add_neighbour).with(@cell).once

        grid = GameOfLife::Grid.new(1, 3)
      end

      it 'adds an adjacent cell below as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(cell, @neighbour)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(2, 1)
      end

      it 'adds an adjacent cell above as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(@neighbour, cell)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(2, 1)
      end

      it 'adds both adjacent cells in the same column as neighbours' do
        GameOfLife::Cell.stub(:new).and_return(@neighbour, cell, @cell)
        cell.should_receive(:add_neighbour).with(@neighbour).once
        cell.should_receive(:add_neighbour).with(@cell).once

        grid = GameOfLife::Grid.new(3, 1)
      end

      it 'adds the cell left-above as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(@neighbour, @cell, @cell, cell)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(2, 2)
      end

      it 'adds the cell right-above as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(@cell, @neighbour, cell, @cell)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(2, 2)
      end

      it 'adds the cell left-below as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(@cell, cell, @neighbour, @cell)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(2, 2)
      end

      it 'adds the cell right-below as neighbour' do
        GameOfLife::Cell.stub(:new).and_return(cell, @cell, @cell, @neighbour)
        cell.should_receive(:add_neighbour).with(@neighbour).once

        grid = GameOfLife::Grid.new(2, 2)
      end

      it 'adds all surrounding cells as neighbours' do
        GameOfLife::Cell.stub(:new).and_return(@neighbour, @neighbour, @neighbour,
                                               @neighbour, cell, @neighbour,
                                               @neighbour, @neighbour, @neighbour)
        cell.should_receive(:add_neighbour).with(@neighbour).exactly(8).times

        grid = GameOfLife::Grid.new(3, 3)
      end
    end
  end

  describe '#print' do
    it 'prints each cell from upper left to lower right' do
      cell.should_receive(:print).exactly(rows * columns).times
      GameOfLife::Cell.stub(:new).and_return(cell)
      grid = GameOfLife::Grid.new(rows, columns)

      capture_stdout { grid.print }
    end
  end

  describe '#update' do
    let(:grid) { GameOfLife::Grid.new(1, 1) }

    context 'given a living cell' do
      before(:each) do
        cell.stub(:alive?).and_return(true)
        GameOfLife::Cell.stub(:new).and_return(cell)
      end

      it 'kills a cell with less than 2 living neighbours' do
        cell.should_receive(:neighbours_alive).and_return(1)
        cell.should_receive(:kill)

        grid.update
      end

      it 'ignores a cell with 2 living neighbours' do
        cell.should_receive(:neighbours_alive).and_return(2)
        cell.should_not_receive(:kill)

        grid.update
      end

      it 'ignores a cell with 3 living neighbours' do
        cell.should_receive(:neighbours_alive).and_return(3)
        cell.should_not_receive(:kill)

        grid.update
      end

      it 'kills a cell with more than 3 living neighbours' do
        cell.should_receive(:neighbours_alive).and_return(4)
        cell.should_receive(:kill)

        grid.update
      end
    end

    context 'given a dead cell' do
      before(:each) do
        cell.stub(:alive?).and_return(false)
        GameOfLife::Cell.stub(:new).and_return(cell)
      end

      it 'ignores a dead cell with less than 3 neighbours' do
        cell.should_receive(:neighbours_alive).and_return(2)
        cell.should_not_receive(:resurrect)

        grid.update
      end

      it 'ignores a dead cell with more than 3 neighbours' do
        cell.should_receive(:neighbours_alive).and_return(4)
        cell.should_not_receive(:resurrect)

        grid.update
      end

      it 'resurrects a dead cell with exactly 3 neighbours' do
        cell.should_receive(:neighbours_alive).and_return(3)
        cell.should_receive(:resurrect)

        grid.update
      end
    end

    it 'synchronizes neighbours' do
      cell.should_receive(:sync_neighbours).exactly(9).times
      GameOfLife::Cell.stub(:new).and_return(cell)
      grid = GameOfLife::Grid.new(3, 3)

      grid.update
    end
  end
end
