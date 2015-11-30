#=
Su Doku (Japanese meaning number place) is the name given to a popular puzzle concept.
Its origin is unclear, but credit must be attributed to Leonhard Euler who invented a similar, and much more difficult,
puzzle idea called Latin Squares.

The objective of Su Doku puzzles, however, is to replace the blanks (or zeros)
in a 9 by 9 grid in such that each row, column, and 3 by 3 box contains each of the digits 1 to 9.
Below is an example of a typical starting puzzle grid and its solution grid.

[ Two Puzzles Here]

A well constructed Su Doku puzzle has a unique solution and can be solved by logic,
although it may be necessary to employ "guess and test" methods in order to eliminate options (there is much contested opinion over this).
The complexity of the search determines the difficulty of the puzzle;
the example above is considered easy because it can be solved by straight forward direct deduction.

The 6K text file, sudoku.txt (right click and 'Save Link/Target As...'),
contains fifty different Su Doku puzzles ranging in difficulty, but all with unique solutions (the first puzzle in the file is the example above).

By solving all fifty puzzles find the sum of the 3-digit numbers found in the top left corner of each solution grid;
for example, 483 is the 3-digit number found in the top left corner of the solution grid above.
=#
include("projecteulerutils.jl")

function valuesinrow(grid, row)
  a = Array{Int64, 1}()
  for x in 1:9
    if grid[row, x] != 0 push!(a, grid[row, x]) end
  end
  a
end

function valuesincolumn(grid, column)
  a = Array{Int64, 1}()
  for y in 1:9
    if grid[y, column] != 0 push!(a, grid[y, column]) end
  end
  a
end

function valuesincurrentcell(grid, x, y)
  result = Array{Int64, 1}()
  startx = round(Int64, (3 * ceil(x / 3)) - 2)
  starty = round(Int64, (3 * ceil(y / 3)) - 2)
  for x in startx:startx+2, y in starty:starty+2
    if grid[y, x] != 0 push!(result, grid[y, x]) end
  end
  result
end

function emptycell(grid)
  for x in 1:9, y in 1:9
    if grid[y, x] == 0 return x, y end
  end
end

function solve(grid)
  if findfirst(grid, 0) == 0 # grid is full
    return true
  else
    x, y = emptycell(grid)
    for value in setdiff(collect(1:9), append!([], [valuesincolumn(grid, x); valuesinrow(grid, y); valuesincurrentcell(grid, x, y)])) # valid values for cell
      grid[y, x] = value
      if solve(grid)
        return true
      end
      grid[y, x] = 0
    end
  end
  false
end

function calc()
  x, total = readdlm(dirname(@__FILE__()) * "/../Resources/p96.txt", ',', Int64), 0
  for i in 1:9:450
    grid = x[i:i+8, 1:9]; solve(grid)
    total += nd(grid[1, 1:3])
  end
  total
end
@time println(calc())
