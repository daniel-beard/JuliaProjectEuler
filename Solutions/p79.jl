#=
A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

The text file, keylog.txt, contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.
=#
include("projecteulerutils.jl")
function matches(list, permutation)
  for i in list
    d = reverse(digits(i))
    if findfirst(permutation, d[1]) > findfirst(permutation, d[2]) || findfirst(permutation, d[2]) > findfirst(permutation, d[3])
      return false
    end
  end
  true
end

function calc()
  strings = sort!(vec(readdlm(dirname(@__FILE__()) * "/../Resources/p79.txt", ',', AbstractString)))
  # Create number set
  numberset = Int64[]
  list = Int64[]
  for string in strings
    [push!(numberset, x) for x in digits(parse(Int, string))]
    push!(list, parse(Int, string))
  end
  numberset = unique(numberset)

  # Permutations
  for p in permutations(numberset)
    if matches(list, p)
      return nd(p)
    end
  end
end
@time println(calc())
