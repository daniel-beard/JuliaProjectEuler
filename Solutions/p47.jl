#=
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
=#

using Primes

function calc()
  num = 4
  arr = Int64[]
  i = 7
  while length(arr) < num
    if (length(keys(factor(i))) == num) && (length(arr) == 0 || last(arr) == i-1)
      push!(arr, i)
    else
      arr = Int64[]
    end
    i += 1
  end
  arr[1]
end
@time println(calc())
