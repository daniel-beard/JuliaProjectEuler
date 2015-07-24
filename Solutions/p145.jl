#=
Some positive integers n have the property that the sum [ n + reverse(n) ] consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).

There are 120 reversible numbers below one-thousand.

How many reversible numbers are there below one-billion (10^9)?
=#

#=
Notes:
- Went with a lazy brute force approach here
- It does give an answer in under a minute though, so I'm not going to improve on it
=#
include("projecteulerutils.jl")
function isReversibleNum(x)
  d = digits(x)
  rev = nd(d)
  if d[1] == 0 # No leading zeros allowed
    return 0
  end
  for i in digits(x+rev)
    if isodd(i) == false
      return 0
    end
  end
  return 1
end

function calc()
  count = 0
  for i in [1:10^8]
    count = count + isReversibleNum(i)
  end
  count
end
@time println(calc())
