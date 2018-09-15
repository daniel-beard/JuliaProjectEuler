#=
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=#
function isdigitcancelling(a,b)
  da = digits(a)
  db = digits(b)
  if a / b > 1 || da[1] == db[1]
    return false
  end

  ra,rb = Int64[],Int64[]
  for i in intersect(da,db)
    if da[1] == db[2]
      push!(ra,da[2])
      push!(rb,db[1])
    end
  end
  return (length(ra) == 1 && length(rb) == 1 && (a/b) == (ra[1]/rb[1])) ? true : false
end

function calc()
  numerators = Int64[]
  denominators = Int64[]
  for i in 10:99
    for j in 10:99
      if isdigitcancelling(i,j)
        push!(numerators, i)
        push!(denominators, j)
      end
    end
  end
  f1,f2 = prod(numerators),prod(denominators)
  d = gcd(f1,f2)
  f1 /= d
  f2 /= d
  Int64(f2)
end
@time println(calc())
