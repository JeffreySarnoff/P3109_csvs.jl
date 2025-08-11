# P3109_csvs.jl
Support for reading P3109 value tables stored as .csv files.

Before you start, you need:
   (a) the zipped csv files of interest, and to unzip them
   (b) Julia and to the Julia packages Tables, CSV
   (c) to let Juia know where the unzipped csv files to reside

(a) obtain the zipped csv files of interest, and unzip them

(b) if Julia is not installed on your system
    - get JuliaUp (which installs the current stable release of Julia)
    ```
      windows:     in a terminal
                   winget install --name Julia --id 9NJNWW8PVKMN -e -s msstore
                   (when prompted, select add to PATH)
                   
      mac, linux:  in a shell
                   curl -fsSL https://install.julialang.org | sh -s -- -y
    ```
    
