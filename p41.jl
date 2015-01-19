#=
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
=#
function nd(a) # Reconstruct a digit from an array
  multiplicand,result = 1,0
  for i in reverse(1:length(a))
    result += multiplicand * a[i]
    multiplicand *= 10
  end
  result
end

function calc()
  largestpandigitalprime = 1
  for n in 2:9
    digit_arr = [i for i in 1:n]
    for permutation in permutations(digit_arr)
      x = nd(permutation)
      if isprime(x) && x > largestpandigitalprime
        largestpandigitalprime = x
      end
    end
  end
  largestpandigitalprime
end
@time println(calc())
