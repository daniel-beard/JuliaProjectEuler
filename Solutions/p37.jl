#=
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
=#
include("projecteulerutils.jl")
using Primes

function istruncatableprime(a)
  da = reverse(digits(a))
  f1,f2 = copy(da), copy(da)
  for i in 1:length(da)-1
    deleteat!(f1,1)
    pop!(f2)
    if !isprime(nd(f1)) || !isprime(nd(f2))
      return false
    end
  end
  true
end

function calc()
  i,count,total = 10,0,0
  while count < 11
    if isprime(i) && istruncatableprime(i)
      count += 1
      total += i
    end
    i += 1
  end
  total
end
@time println(calc())
