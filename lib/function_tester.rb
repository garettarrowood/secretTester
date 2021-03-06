require 'prime'
require 'pry'

class AdditiveAnalyzer
  def initialize(integer, secret)
    @integer = integer
    @secret = secret
  end

  def run!
    return false unless highest_primes_check
    repition = prime_array.size - 1
    while repition > 0
      additive_cycle(repition)
      repition-=1
    end
    true
  end

  def additive_cycle(repition)
    counter=1
    repition.times do 
      x = prime_array[repition]
      y = prime_array[repition-counter]
      return false if !additive?(x, y)
      counter+=1 
    end
  end

  def highest_primes_check
    return true if smallness_check
    highestPrime = @integer
    highestPrime-=1 until highestPrime.prime? 
    nextHighestPrime = highestPrime - 2
    nextHighestPrime-=2 until nextHighestPrime.prime?
    additive?(highestPrime, nextHighestPrime)
  end

  def smallness_check
    @integer <= 4
  end

  def additive?(x,y)
    @secret.call(x)+@secret.call(y) == @secret.call(x + y)
  end

  def prime_array
    array = []
    Prime.each(@integer) { |prime| array << prime }
  end
end
