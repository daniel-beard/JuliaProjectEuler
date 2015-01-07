#=
The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
=#

function isdecpalindrome(a)
  digits(a) == reverse(digits(a))
end

function isbinarypalindrome(a)
  bin(a) == reverse(bin(a))
end

function calc()
  total = 0
  for i in 1:999_999
    if isdecpalindrome(i) && isbinarypalindrome(i)
      total += i
    end
  end
  total
end
@time println(calc())
