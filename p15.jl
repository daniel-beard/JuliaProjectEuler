#=
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
=#

# 1x1 = 2
# 2x2 = 6

# binomial coefficient is a way to calculate pascals triangle
# binomial(row, column)
# = row! / (column!*(row-column)!)
# reference: http://www.mathwords.com/b/binomial_coefficients_pascal.htm

function number_of_paths(x)
  x *= 2
  binomial(x,div(x,2))
end
@time println(number_of_paths(20))
