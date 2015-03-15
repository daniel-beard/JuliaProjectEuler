#=
It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
=#
include("projecteulerutils.jl")
function calc()
  i = 1
  while true
    y = [digits(i * a) for a in [1:6]]
    if filter(x->ispermutation(first(y),x), y) |> length == 6
      return i
    end
    i += 1
  end
end
@time println(calc())
