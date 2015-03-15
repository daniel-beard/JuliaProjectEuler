#=
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
=#

function sum_proper_divisors(n)
  prod = 1
  k = 2
  while k*k <= n
    p = 1
    while n%k==0
      p=p*k+1
      n = div(n,k)
    end
    prod*=p
    k += 1
  end
  if n>1
    prod*=1+n
  end
  prod
end

function abundant_numbers_less_than(n)
  arr = Int64[]
  for i in 1:n-1
    if sum_proper_divisors(i) > i+i
      push!(arr, i)
    end
  end
  arr
end

function calc(n)
  abundant_nums = abundant_numbers_less_than(n)
  canbewrittenasabundant = Bool[false for x in 1:n]
  for i in 1:length(abundant_nums)
    for j in 1:length(abundant_nums)
      if abundant_nums[i] + abundant_nums[j] <= n
        canbewrittenasabundant[abundant_nums[i]+abundant_nums[j]] = true
      else
        break
      end
    end
  end

  total = 0
  for i in 1:n
    total += canbewrittenasabundant[i] ? 0 : i
  end
  total
end
@time println(calc(28_124))
