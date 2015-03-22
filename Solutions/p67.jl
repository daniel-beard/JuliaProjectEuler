#=
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 2^99 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)
=#
#a =
function readfile(file)
  f = open(file)
  lines = readlines(f)
  arr = Array[]
  c(x) = push!(arr, int(split(strip(x), ',')))
  for line in lines
    c(line)
  end
  arr
end

function calc()
  arr = readfile(dirname(@__FILE__()) * "/../Resources/p67.txt")
  result = Array[]
  push!(result, arr[length(arr)])
  for row in reverse(1:length(arr)-1)
    nextrow = Int64[]
    for column in 1:length(arr[row])
      lowleft = last(result)[column]
      lowright = last(result)[column+1]
      center = arr[row][column]
      push!(nextrow, max(center+lowleft, center+lowright))
    end
    push!(result, nextrow)
  end
  last(result)[1]
end
@time println(calc())
