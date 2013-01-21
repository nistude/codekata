module RomanNumeralConverter
  def to_roman(number)
    roman = []

    if number < 4
      number.times { roman << 'I' }
    elsif number == 4
      roman << 'IV'
    elsif number < 9
      roman << 'V'
      roman << to_roman(number - 5)
    elsif number == 9
      roman << 'IX'
    elsif number < 40
      roman << 'X'
      roman << to_roman(number - 10)
    elsif number < 50
      roman << 'XL'
      roman << to_roman(number - 40)
    elsif number < 90
      roman << 'L'
      roman << to_roman(number - 50)
    elsif number < 100
      roman << 'XC'
      roman << to_roman(number - 90)
    elsif number < 400
      roman << 'C'
      roman << to_roman(number - 100)
    end

    roman.join
  end
end
