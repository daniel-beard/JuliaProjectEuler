#=
The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

1! + 4! + 5! = 1 + 24 + 120 = 145

Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:

169 → 363601 → 1454 → 169
871 → 45361 → 871
872 → 45362 → 872

It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

69 → 363600 → 1454 → 169 → 363601 (→ 1454)
78 → 45360 → 871 → 45361 (→ 871)
540 → 145 (→ 145)

Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?
=#
function sumOfFactorialOfDigits(x)
  total = sum(map(factorial, digits(x)))
end

#TODO: Kinda slowish, could be sped up by memoizing each start number -> count of terms
function lengthOfLoop(x)
  arr = Int64[]
  last = x
  while true
    current = sumOfFactorialOfDigits(last)
    if in(current, arr)
      return length(arr) + 1
    end
    push!(arr, current)
    last = current
  end
end

function calc()
  count = 0
  for i in 69:999_999
    if lengthOfLoop(i) == 60
      count = count + 1
    end
  end
  count
end
@time println(calc())
