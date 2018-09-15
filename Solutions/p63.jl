#=
The 5-digit number, 16807=75, is also a fifth power. Similarly, the 9-digit number, 134217728=89, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
=#
function calc()
  count = 0
  for n in 1:100, p in 1:100
    x = BigInt(n)^p
    if length("$x") == p
      count += 1
    end
  end
  count
end
@time println(calc())
