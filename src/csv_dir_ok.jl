const UF = (relpath = joinpath("unsigned", "finite"),   suffix = "uf", signed=false, unsigned=true,  extended=false, finite=true)
const UE = (relpath = joinpath("unsigned", "extended"), suffix = "ue", signed=false, unsigned=true,  extended=true,  finite=false)
const SF = (relpath = joinpath("signed", "finite"),     suffix = "sf", signed=true,  unsigned=false, extended=false, finite=true)
const SE = (relpath = joinpath("signed", "extended"),   suffix = "se", signed=true,  unsigned=false, extended=true,  finite=false)

from_suffix = Dict( ["uf", "ue", "sf", "se"] .=> [UF, UE, SF, SE])

function confirm_csv_env()
    csv_dir = get(ENV, "P3109_CSV_DIR", nothing)
    if isnothing(csv_dir)
        error("""ENV["P3109_CSV_DIR"] is not set""")
    end
    if !isdir(csv_dir)
        error("""ENV["P3109_CSV_DIR"] $(csv_dir) is not a full directory path""")
    end
end

function csv_filepath(bitwidth::Int, suffix::String, base::Int)
    super_dir = csv_super_dir(suffix, base)
    info = from_suffix[suffix]
    if base == 10
        ext = ".dec.csv"
    else
        ext = ".hex.csv"
    end

    filestr = string("binary", bitwidth, "s", ext)
    abspath(joinpath(super_dir, filestr))
end

function csv_super_dir(suffix::String, base::Int)
    if !(suffix in ("uf", "ue", "sf", "se"))
        error("""suffix must be one of {"uf", "ue", "sf", "se"}""")
    end
    if !(base == 10 || base == 16)
        error("base must be 10 or 16")
    end
    if base == 10
        subdir = "decimal"
    else
        subdir = "hexadecimal"
    end

    info = from_suffix[suffix]
    abspath(joinpath(ENV["P3109_CSV_DIR"], subdir, info.relpath))
end

    
    
