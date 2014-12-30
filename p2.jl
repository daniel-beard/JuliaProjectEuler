#=
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
=#

fib(n) = n < 2 ? n : fib(n - 1) + fib(n - 2)

function fibsUnder4Million()
  i = 2
  while fib(i) <= 4_000_000
    produce(fib(i))
    i += 1
  end
end

function calculate()
  total = 0
  p = Task(fibsUnder4Million)
  for i in p
    if i % 2 == 0
      total += i
    end
  end
  println(sum)
end
time = @elapsed calculate()
println("Took: $(time) seconds")