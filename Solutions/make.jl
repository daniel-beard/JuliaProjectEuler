
# Read all files with "p{number}.jl"
files = readdir(dirname(@__FILE__()))
files = sort(filter((x)->ismatch(r"^p\d*\.jl", x), files))

# Run!
totaltime = 0
for i in 1:length(files)
  "Running file $i of $(length(files)) : $(files[i])" |> println
  totaltime = totaltime + @elapsed evalfile(files[i])
end
"Took $totaltime seconds to run $(length(files)) files" |> println
