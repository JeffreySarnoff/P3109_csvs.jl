module P3109_csvs.jl

using Tables
using Tables: columntable
using CSV

"""
    @assign(symexpr, val)

Assign `val` to the variable named by `symexpr`.

- `@assign(:x, v)` → `x = v`
- `@assign(x, v)`:
    * If `x` is bound (as a global) to a `Symbol` at macro-expansion time,
      assign to that symbol (e.g. `this_symbol = v` when `x == :this_symbol`).
    * Otherwise assign to `x` itself.
- `@assign(expr, v)` where `expr` evaluates (at macro-expansion) to a `Symbol`
  → assign to that symbol.

Note: macros cannot create/assign locals whose names are only known at runtime.
"""
macro assign(symexpr, val)
    # Case 1: literal :name
    if symexpr isa Base.QuoteNode && symexpr.value isa Symbol
        return Expr(:(=), esc(symexpr.value), esc(val))
    end

    # Case 2: bare identifier
    if symexpr isa Symbol
        # If the identifier is a global that currently holds a Symbol, use that
        if Base.isdefined(__module__, symexpr)
            local v = Base.eval(__module__, symexpr)
            if v isa Symbol
                return Expr(:(=), esc(v), esc(val))
            end
        end
        # Otherwise, assign to the identifier itself
        return Expr(:(=), esc(symexpr), esc(val))
    end

    # Case 3: general expression that should evaluate to a Symbol at expansion
    local s = Base.eval(__module__, symexpr)
    s isa Symbol || error("@assign: first argument must be or evaluate to a Symbol; got $(repr(s))")
    return Expr(:(=), esc(s), esc(val))
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
