#=
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#

function calc()
  min = 100; max = 999
  maxPalindrome = 0
  for i in min:max, j in min:max
      current = i * j
      if string(current) == reverse(string(current))
        maxPalindrome = current > maxPalindrome ? current : maxPalindrome
      end
  end
  maxPalindrome
end
@time println(calc())
