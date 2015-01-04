#=
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
=#
coins = [1,2,5,10,20,50,100,200]
# Number of ways of making change for n cents
# using only the first k types of coins
function coin(n,k)
  if k < 1 || n < 0
    return 0
  elseif n == 0
    return 1
  end
  coin(n, k-1)+coin(n-coins[k], k)
end
@time println(coin(200,8))
