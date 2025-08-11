module P3109_csvs.jl

using Tables
using Tables: columntable
using CSV

macro assign(var, val)
    :($(esc(var)) = $(esc(val)))
end

include("csv_dir_ok.jl")
confirm_csv_dir()

#=
usage

csvfile = csv_filepath(bits = 8, suffix = "se", base = 10)
csvcodes, csvdata = csv_data(csvfile)

println("encoding = ")
println(csvcodes)

=#


end  # module
