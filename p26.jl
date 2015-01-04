#=
A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
=#

# Multiplicative order
# http://mathworld.wolfram.com/MultiplicativeOrder.html
function multiplicative_order(a, n)
  if gcd(a,n) > 1
    return 0
  else
    order = 1
    mod_exp = a
    while mod_exp != 1
      order +=1
      mod_exp = (mod_exp * a) % n
    end
    return order
  end
end

function calc()
  largest = 0
  max_i = 0
  for i in 2:1000
    a = multiplicative_order(10, i)
    if a > largest
      largest = a
      max_i = i
    end
  end
  max_i
end
@time println(calc())
