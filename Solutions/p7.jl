#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=#

using Primes
function findnthprime(n)
  i = 2; foundprimes = 0; lastprime = 0
  while foundprimes < n
    if isprime(i)
      foundprimes += 1
      lastprime = i
    end
    i += 1
  end
  lastprime
end

@time println(findnthprime(10_001))
