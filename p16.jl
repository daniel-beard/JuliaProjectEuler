#=
215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?
=#
function powersum()
  x = BigInt(1000)
  sum(digits(2^x))
end
@time println(powersum())
