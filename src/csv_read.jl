function read_P3109_csv(filepath)
    stripstr(x) = strip(string(x))
  
    checkfile(filepath)
    csv = CSV.read(filepath, columntable)
    colstrs = map(stripstr, keys(csv))
    colsyms  = Symbol.(colstrs)

    codesym = colsyms[1]
    codepoints = encoding(csv)

    colstrs = colstrs[2:end]
    colsyms = colsyms[2:end]

    datastrvecs = values(csv)[2:end]
    datastrvecs = map(x->map(stripstr,x), datastrvecs)

    datavecs = map(valuedata, datastrvecs)
    
    return (codesym, codepoints), (colsyms, datavecs)
end

function valuedata(datastrs)
    str = datastrs[2]
    if str[2] == 'x'
        xpstr = split(str,'p')[2]
        xp = Base.parse(Int, xpstr)
        if xp < exponent(floatmin(Float64))
            map(BigFloat, datastrs)
        else
            map(x->Base.parse(Float64, x), datastrs)
        end
    else
        if occursin("e", str)
            xpstr = split(str, 'e')[2]
            xp = Base.parse(Int, xpstr)
            if xp < exponent(floatmin(Float64))
                map(BigFloat, datastrs)
            else
                map(x->Base.parse(Float64, x), datastrs)
            end
        else
            map(x->Base.parse(Float64, x), datastrs)
        end
    end
end

function encoding(csv)
    colnames = map(stripstr, keys(csv))
    colsyms  = Symbol.(colnames)
    codestrs = map(stripstr, values(csv)[1])
    T = length(codestrs[1]) <= 4 ? UInt8 : UInt16
    map(x->Base.parse(T, x), codestrs)
end

function checkfile(filepath)
    if !isfile(filepath)
        error("$(filepath) is not a file")
    end
end  

  
