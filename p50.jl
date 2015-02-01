#=
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
=#
function calc()

  x = 10^6
  p = primes(x-1)
  largestrun = largestprime = 0

  for i in 1:length(p)
    currentsum = 0
    for j in i:length(p)
      currentsum += p[j]
      if currentsum >= x
        break
      end
      if isprime(currentsum) && j-i > largestrun
        largestrun = j-i
        largestprime = currentsum
      end
    end
  end
  largestprime
end
@time println(calc())
