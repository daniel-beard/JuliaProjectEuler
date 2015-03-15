#=
An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
=#
function champernowne_digit(n)
  index, digit = 1, 1
  while index < n
    d = reverse(digits(digit))
    nextindex = index + length(d)
    if nextindex > n
      return d[(n+1)-index]
    end
    digit += 1
    index += length(d)
  end
  reverse(digits(digit))[1]
end

function calc()
  arr = Int64[]
  for i in [1, 10, 100, 1_000, 10_000, 100_000, 1_000_000]
    push!(arr, champernowne_digit(i))
  end
  prod(arr)
end
@time println(calc())
