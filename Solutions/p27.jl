#=
Euler discovered the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n² + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |−4| = 4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
=#

using Primes

function longestprimerun(a,b)
  i = 0
  while isprime((i^2)+(a*i)+b)
    i+= 1
  end
  i
end

function calc()
  (mina, maxa) = (-1000, 1000)
  (largesta, largestb) = (0,0)
  largest = 0
  for a in mina:maxa, b in mina:maxa
    primerun = longestprimerun(a,b)
    if primerun > largest
      (largesta, largestb) = (a,b)
      largest = primerun
    end
  end
  largesta * largestb
end
@time println(calc())
