#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=#

using Primes
function findnthprime(n)
  x = Int[]
  i = 2
  while length(x) < n
    if isprime(i)
      push!(x, i)
    end
    i += 1
  end
  last(x)
end

@time println(findnthprime(10_001))
