#=
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=#

function find_collatz(x::Int64)
  count = 0
  while x > 1
    x = iseven(x) ? div(x,2) : 3x+1
    count +=1
  end
  count
end

function calc()
  startnumber = 1
  longest = 1
  for i in 1:1_000_000
    c = find_collatz(i)
    if c > longest
      longest = c
      startnumber = i
    end
  end
  startnumber
end
@time println(calc())
