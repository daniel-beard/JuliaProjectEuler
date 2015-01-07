#=
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
=#
function calc()
  total = 0
  for i in 3:9_999_999
    if sum(map((x)->factorial(x),digits(i))) == i
      total += i
    end
  end
  total
end
@time println(calc())
