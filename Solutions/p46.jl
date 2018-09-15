#=
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
=#

using Primes

function nextoddcomposite(x)
  n = x
  while true
    n += 2
    if isprime(n) == false
      return n
    end
  end
end

function calc()
  composite = 7
  while true
    composite = nextoddcomposite(composite)
    primesless = reverse(primes(composite))
    canbecalculated = false
    for p in primesless, i in 1:54
      if p + 2*(i^2) == composite
        canbecalculated = true
      end
    end
    if canbecalculated == false
      return composite
    end
  end
end
@time println(calc())

