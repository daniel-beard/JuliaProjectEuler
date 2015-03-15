#=
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
=#
function calc()
  dict = Dict{Float64, Set}()

  for i in 1:1000
    for j in 1:1000
      k = i^2+j^2
      key = i + j + sqrt(k)
      if sqrt(k) != floor(sqrt(k)) || key > 1000
        continue
      end

      if haskey(dict, key) == false
        dict[key] = Set()
      else
        push!(dict[key], sort!([i, j, sqrt(k)]))
      end
    end
  end

  (maxkey, maxcount) = 0,0
  for key in keys(dict)
    count = length(dict[key])
    if count > maxcount
      maxcount, maxkey = count, key
    end
  end
  maxkey
end
@time println(calc())
