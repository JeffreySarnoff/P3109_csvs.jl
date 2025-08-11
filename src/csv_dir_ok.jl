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

  
