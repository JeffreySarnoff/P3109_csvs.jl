module P3109_csvs.jl

using Tables
using Tables: columntable
using CSV

setprecision(BigFloat, 64) # 24 works too

include("assign.jl")
include("csv_dir_ok.jl")

confirm_csv_dir()

#=
usage

csvfile = csv_filepath(bits = 8, suffix = "se", base = 10)
csvcodes, csvdata = read_P3109_csv(csvfile)

println("encoding = ")
println(csvcodes)

=#


end  # module
