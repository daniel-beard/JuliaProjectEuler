#=
A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?
=#
function calc()
  maxsum = 1
  for a in 1:100
    for b in 1:100
      x = a^BigInt(b)
      s = sum(digits(x))
      maxsum = max(maxsum, s)
    end
  end
  maxsum
end
@time println(calc())
