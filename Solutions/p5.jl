#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#

function smallestevenlydivisiblebyallupto(maxdivisor)
  current = 20
  while true
    maxforcurrent = 1
    for i in 1:maxdivisor
      if rem(current, i) == 0
        maxforcurrent = i
      else
        break
      end
    end
    if maxforcurrent == maxdivisor
      break
    end
    current += 20
  end
  current
end

time = @elapsed println(smallestevenlydivisiblebyallupto(20))
println("Took: $(time) seconds")
