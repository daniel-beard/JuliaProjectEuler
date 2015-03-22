#=
A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.

For example,

44 → 32 → 13 → 10 → 1 → 1
85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.

How many starting numbers below ten million will arrive at 89?
=#
cache = Int[]
function digitchain(n)
  while true
    if n < length(cache)
      return cache[n]
    end
    n = map((x)->x^2, digits(n)) |> sum
    if n == 1
      return 1
    elseif n == 89
      return 89
    end
  end
end

function calc()
  count = 0
  for i in 1:10_000_000
    d = digitchain(i)
    push!(cache, d)
    if d == 89
      count = count + 1
    end
  end
  count
end
@time println(calc())
