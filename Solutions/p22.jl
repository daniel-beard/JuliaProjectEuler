#=
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
=#

function namescore(name, index)
  total = 0
  for i in 1:length(name)
    total += convert(Int64, name[i])-64
  end
  total *= index
end

function calc()
  x = sort!(vec(readdlm(dirname(@__FILE__()) * "/../Resources/p22.txt", ',', AbstractString)))
  total = 0
  for i in 1:length(x)
    total += namescore(x[i], i)
  end
  total
end
@time println(calc())
