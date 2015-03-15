#=
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
=#

# This solution is not as clean as I'd like, but it is fast
dict = [
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
]

tens_digits = [
  2 => "twenty",
	3 => "thirty",
	4 => "forty",
	5 => "fifty",
	6 => "sixty",
	7 => "seventy",
	8 => "eighty",
	9 => "ninety"
  ]

function number_name(value, result, tens = false)
  value_digits = reverse(digits(value))

  if value == 0
    return result
  end

  if length(value_digits) == 4
    result = result * dict[first(value_digits)]
    result = result * "thousand"
    number_name(rem(value,1000), result)
  elseif length(value_digits) == 3
    result = result * dict[first(value_digits)]
    result = result * "hundred"
    number_name(rem(value,100), result)
  elseif length(value_digits) <= 2
    if value >= 20
      if length(result) > 0
        result = result * "and"
      end
      result = result * tens_digits[first(value_digits)]
      number_name(rem(value,10),result, true)
    else
      if length(result) > 0 && tens == false
        result = result * "and"
      end
      result = result * dict[value]
      number_name(0, result)
    end
  end
end

total = 0
for i in 1:1000
  total += length(number_name(i, ""))
end
@time println(total)

