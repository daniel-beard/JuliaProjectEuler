#=
Comparing two numbers written in index form like 211 and 37 is not difficult, as any calculator would confirm that 211 = 2048 < 37 = 2187.

However, confirming that 632382518061 > 519432525806 would be much more difficult, as both numbers contain over three million digits.

Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.

NOTE: The first two lines in the file represent the numbers in the example given above.
=#
function calc()
  combined = readdlm(dirname(@__FILE__()) * "/../Resources/p99.txt", ',', Int64)
  bases = vec(combined[1:1000])
  exponents = vec(combined[1001:2000])
  max, line = 0,0
  for i in 1:1000
    result = exponents[i]*log10(bases[i])
    if result > max
      max, line = result, i
    end
  end
  line
end
@time println(calc())
