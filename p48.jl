#=
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
=#
function calc()
  a = [i^BigInt(i) for i in 1:1000]
  d = reverse(digits(sum(a))[1:10])
  result = ""
  for digit in d
    result *= "$digit"
  end
  result
end
@time println(calc())
