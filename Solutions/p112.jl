#=
Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly 99%.
=#
function isBouncy(x)
  if length(digits(x)) < 3
    return false
  end
  arr = reverse(digits(x))
  isIncreasing = issorted(arr)
  isDecreasing = issorted(arr, rev=true)
  return !isIncreasing && !isDecreasing
end

function calc()
  bouncycount, proportion, i = 0, 0, 1
  while proportion < .99
    bouncycount = isBouncy(i) ? bouncycount + 1 : bouncycount
    proportion = (bouncycount > 0) ? bouncycount / i : 0
    i = i + 1
  end
  i - 1
end
@time println(calc())
