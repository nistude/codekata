require 'roman_numeral_converter'

describe RomanNumeralConverter do
  include RomanNumeralConverter

  describe '#to_roman' do
    it 'converts 1 to I' do
      to_roman(1).should == 'I'
    end

    it 'converts 2 to II' do
      to_roman(2).should == 'II'
    end

    it 'converts 4 to IV' do
      to_roman(4).should == 'IV'
    end

    it 'converts 5 to V' do
      to_roman(5).should == 'V'
    end

    it 'converts 6 to VI' do
      to_roman(6).should == 'VI'
    end

    it 'converts 9 to IX' do
      to_roman(9).should == 'IX'
    end

    it 'converts 10 to X' do
      to_roman(10).should == 'X'
    end

    it 'converts 13 to XIII' do
      to_roman(13).should == 'XIII'
    end

    it 'converts 20 to XX' do
      to_roman(20).should == 'XX'
    end

    it 'converts 40 to XL' do
      to_roman(40).should == 'XL'
    end

    it 'converts 41 to XLI' do
      to_roman(41).should == 'XLI'
    end

    it 'converts 50 to L' do
      to_roman(50).should == 'L'
    end

    it 'converts 78 to LXXVIII' do
      to_roman(78).should == 'LXXVIII'
    end

    it 'converts 90 to XC' do
      to_roman(90).should == 'XC'
    end

    it 'converts 91 to XCI' do
      to_roman(91).should == 'XCI'
    end

    it 'converts 100 to C' do
      to_roman(100).should == 'C'
    end

    it 'converts 400 to CD'
    it 'converts 500 to D'
    it 'converts 900 to CM'
    it 'converts 1000 to M'
    it 'converts 2000 to MM'
    it 'converts 3493 to MMMCDXCIII'

    context 'when converting 0' do
      it 'returns an error message'
    end
  end
end
