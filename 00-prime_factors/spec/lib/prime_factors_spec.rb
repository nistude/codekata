require 'prime_factors'

describe PrimeFactors do
  include PrimeFactors

  describe '#decompose' do
    context 'for 0' do
      it 'returns an empty list' do
        decompose(0).should == []
      end
    end

    context 'for 1' do
      it 'returns an empty list' do
        decompose(0).should == []
      end
    end

    context 'for 2' do
      it 'returns 2' do
        decompose(2).should == [2]
      end
    end

    context 'for 3' do
      it 'returns 3' do
        decompose(3).should == [3]
      end
    end

    context 'for 4' do
      it 'returns 2, 2' do
        decompose(4).should == [2, 2]
      end
    end

    context 'for 5' do
      it 'returns 5' do
        decompose(5).should == [5]
      end
    end

    context 'for 6' do
      it 'returns 2, 3' do
        decompose(6).should == [2, 3]
      end
    end

    context 'for 9' do
      it 'returns 3, 3' do
        decompose(9).should == [3, 3]
      end
    end

    context 'for 9973' do
      it 'returns 9973' do
        decompose(9973).should == [9973]
      end
    end

    context 'for 9975' do
      it 'returns 3, 5, 5, 7, 19' do
        decompose(9975).should == [3, 5, 5, 7, 19]
      end
    end
  end
end
