module PrimeFactors
  def decompose(number)
    return [] if number < 2

    factors = []
    half = number / 2
    (2..half).each do |factor|
      if number % factor == 0
        factors << factor
        factors << decompose(number / factor)
        break
      end
    end
    factors.empty? ? [number] : factors.flatten.compact
  end
end
