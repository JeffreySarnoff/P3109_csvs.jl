function readP3109csv(filepath)
    stripstr(x) = strip(string(x))
  
    checkfile(filepath)
    csv = CSV.read(filepath, columntable)
    colnames = map(stripstr, keys(csv))
    colsyms  = Symbol.(colnames)
    encodingname = colsyms[1]
    codepoints = @assign( encodingname (; $encodignname = encoding(csv))
    codestrs = map(stripstr, values(csv)[1])
    T = length(codestrs[1]) <= 4 ? UInt8 : UInt16
    encoding = map(x->Base.parse(T, x), codestrs)
  
  
function encoding(csv)
    colnames = map(stripstr, keys(csv))
    colsyms  = Symbol.(colnames)
    codestrs = map(stripstr, values(csv)[1])
    T = length(codestrs[1]) <= 4 ? UInt8 : UInt16
    encoding = map(x->Base.parse(T, x), codestrs)
    
function checkfile(filepath
    if !isfile(filepath)
        error("$(filepath) is not a file")
    end
end  

  
