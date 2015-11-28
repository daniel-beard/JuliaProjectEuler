#=
The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3).
In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are cube.
=#
include("projecteulerutils.jl")

function largest_permutation(i)
  nd(reverse(sort(reverse(digits(i)))))
end

function calc()
  i, max_permutations = 1, 5
  hash = Dict{Int64, Array{Int64}}()  #largest_permutation => [smallest_cube, count]
  while true
    current_cube = i ^ 3
    largest = largest_permutation(current_cube)
    v = get(hash, largest, [current_cube, 0])
    count = v[2] + 1
    hash[largest] = [v[1], count]
    if count == max_permutations
      return v[1]
    end
    i = i + 1
  end
end
@time println(calc())
