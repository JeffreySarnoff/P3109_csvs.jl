function confirm_csv_env()
    csv_dir = get(ENV, "P3109_CSV_DIR", nothing)
    if isnothing(csv_dir)
        error("""ENV["P3109_CSV_DIR"] is not set""")
    end
    if !isdir(csv_dir)
        error("""ENV["P3109_CSV_DIR"] $(csv_dir) is not a full directory path""")
    end
end


  
