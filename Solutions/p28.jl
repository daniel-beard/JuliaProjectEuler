#=
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
=#
#=
Notes:

#[1],2,[3],4,[5],6,[7],8,[9],10,11,12,[13],14,15,16,[17],18,19,20,[21],22,23,24,[25]
#1,3,5,7,9,13,17,21,25,31,37,43,49
#2, 4, 6
#3x3, 5x5, 7x7
=#
function calc()
  total,start = 1,1
  step = 2
  iterations = 3
  currentsquaresize = 3
  while currentsquaresize <= 1001
    start += step
    for i in start:step:(start+(iterations*step))
      total += i
    end
    start += (iterations*step)
    currentsquaresize += 2
    step += 2
  end
  total
end
@time println(calc())
