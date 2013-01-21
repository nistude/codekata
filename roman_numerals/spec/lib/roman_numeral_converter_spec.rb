require 'roman_numeral_converter'

describe RomanNumeralConverter do
  describe '#to_roman' do
    it 'converts 1 to I'
    it 'converts 2 to II'
    it 'converts 4 to IV'
    it 'converts 5 to V'
    it 'converts 6 to VI'
    it 'converts 9 to IX'
    it 'converts 10 to X'
    it 'converts 13 to XIII'
    it 'converts 20 to XX'
    it 'converts 40 to XL'
    it 'converts 50 to L'
    it 'converts 78 to LXXVIII'
    it 'converts 90 to XC'
    it 'converts 100 to C'
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
