#=
Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
where each “_” is a single digit.
=#

#TODO: Try iterating by calculating the squares as permutations then grabbing sqrts.
function calc()
  # This is kinda icky.
  for i in 1238902700:3238902700
    s = i^2
    if length("$s") != 19
      continue
    end
    if occursin(r"1\d2\d3\d4\d5\d6\d7\d8\d9\d0", "$s")
      return round(Int64, sqrt(s))
    end
  end
end
@time println(calc())
