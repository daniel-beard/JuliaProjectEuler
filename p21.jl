#=
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
=#

function sum_proper_divisors(n)
  i = 1
  sum = 0
  while (i < n)
    if n%i==0
      sum += i
    end
    i += 1
  end
  sum
end

function calc()
  sum = 0
  for i in 1:9_999
    a = sum_proper_divisors(i)
    b = sum_proper_divisors(a)
    if i == b && a != b
      sum += i
    end
  end
  sum
end
@time println(calc())
