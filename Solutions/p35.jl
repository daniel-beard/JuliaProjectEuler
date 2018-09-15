#=
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
=#
include("projecteulerutils.jl")
using Primes

function iscircularprime(x)
  i = reverse(digits(x))
  a = copy(i)
  circularprime = true
  for j in i
    if !isprime(nd(a))
      return false
    end
    a = prepend!(a, [pop!(a)])
  end
  true
end

function calc()
  count = 0
  for x in primes(2_000_000)
    if iscircularprime(x)
      count += 1
    end
  end
  count
end
@time println(calc())
