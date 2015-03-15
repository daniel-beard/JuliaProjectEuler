#=
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
=#
include("projecteulerutils.jl")
function calc()
  b = c = 0
  for a in 1000:10000-3330-3330
    if a == 1487
      continue
    end
    b = a+3330
    c = b+3330
    if isprime(a)
      if isprime(b)
        if isprime(c)
          if ispermutation(digits(a),digits(b)) && ispermutation(digits(b), digits(c))
            return "$a$b$c"
          end
        end
      end
    end
  end
end
@time println(calc())
