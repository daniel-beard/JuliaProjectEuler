#=
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
=#
include("projecteulerutils.jl")
function calc()
  matches = Int64[]
  for c in permutations([1:9])
    c1,c2,c3 = c[1:2],c[3:5],c[6:9] # 2x3
    d1,d2,d3 = c[1:1],c[2:5], c[6:9] # 1x4
    if nd(c1) * nd(c2) == nd(c3)
      push!(matches, nd(c3))
    end
    if nd(d1) * nd(d2) == nd(d3)
      push!(matches, nd(d3))
    end
  end
  sum(unique(matches))
end
@time println(calc())
