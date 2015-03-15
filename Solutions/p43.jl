#=
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
=#
include("projecteulerutils.jl")

function calc()
  sum = 0
  for n in permutations([0:9])
    if n[1] != 0
      isvalid = true
      y = [2,3,5,7,11,13,17]
      for x in [2:8]
        if nd(n[x:x+2]) % y[x-1] != 0
          isvalid = false
          break
        end
      end
      sum += isvalid ? nd(n) : 0
    end
  end
  sum
end
@time println(calc())
