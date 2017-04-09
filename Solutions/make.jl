
Pkg.add("Primes")
Pkg.add("Combinatorics")
Pkg.update()

# Read all files with "p{number}.jl"
files = readdir(dirname(@__FILE__()))
files = sort(filter((x)->ismatch(r"^p\d*\.jl", x), files))

# Run!
totaltime = @parallel (+) for i=1:length(files)
  "Running file $i of $(length(files)) : $(files[i])" |> println
  @elapsed evalfile(files[i])
end
"Took $totaltime seconds to run $(length(files)) files" |> println
