#=
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=#
#=
Note: Calculating limit:
Checking the number 111111111.
That number has 9 digits, so the maximum sum would be 9*59049 = 531441, which doesn't even come close to 111111111.
So any 9 digit number or greater can't ever reach a big enough sum.
=#
function sumofdigitpowers(a)
  total = 0
  i = 2
  while i < length(digits(i))*9^a
    current = sum(map((x)->x^a, digits(i)))
    if current == i
      total += i
    end
    i+=1
  end
  total
end
@time println(sumofdigitpowers(5))
