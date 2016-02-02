require 'prime'

def secret_test(int, secret)
  return false unless quick_fail(int, secret)
  array = primes(int)
  counter = array.size - 1
  while counter > 0
    x=1
    counter.times do 
      return false unless (secret.call(array[counter])+secret.call(array[counter-x]) == secret.call(array[counter]+array[counter-x]))
      x+=1
    end
    counter-=1
  end
  true
end

def quick_fail(int, secret)
  return true if int <= 4
  int-=1 until int.prime? 
  nextPrime = int - 2
  nextPrime-=2 until nextPrime.prime?
  return false unless (secret.call(int)+secret.call(nextPrime)) == secret.call(int + nextPrime)
  true
end

def primes(int)
  array = []
  Prime.each(int) { |prime| array << prime }
end

SECRETS = [Proc.new {|int| int}, Proc.new {|int| int*int}, Proc.new{|int| Math.cbrt(int)}, Proc.new {|int| int/200}, Proc.new {|int| int/1000} ]
