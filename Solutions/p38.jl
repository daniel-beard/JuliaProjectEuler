#=
Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
=#
function canbepandigital(n)
  stringresult = ""
  i = 1
  while length(stringresult) < 9
    stringresult *= string(n * i)
    i += 1
  end

  if (length(stringresult)) == 9
    result = int(stringresult)
    if sort(digits(result)) == [1:9]
      return (true,result)
    end
  end
  (false, 0)
end

function calc()
  maxpandigital = 0
  for i in 2:10_000
    (result, pandigital) = canbepandigital(i)
    if result
      if pandigital > maxpandigital
        maxpandigital = pandigital
      end
    end
  end
  maxpandigital
end
@time println(calc())
