#=
There are exactly ten ways of selecting three from five, 12345:

123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

In combinatorics, we use the notation, 5C3 = 10.

In general,

nCr =
n!
r!(n−r)!
,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater than one-million?
=#
function combine(n, r)
  factorial(n)/(factorial(r)factorial(n-r))
end

function calc()
  sum = 0
  for n in 1:100, r in reverse(1:n)
    if combine(BigInt(n), BigInt(r)) > 1_000_000
      sum = sum + 1
    end
  end
  sum
end
@time println(calc())
