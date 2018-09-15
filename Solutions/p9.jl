#=
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=#

# Kinda ugly brute force approach
function findABC()
  max = 1000
  for a in 1:max, b in 1:max, c in 1:max
    if a >= b || b >= c || a + b + c != max
      continue
    end
    if a^2 + b^2 == c^2
      return a*b*c
    end
  end
end

@time println(findABC())

