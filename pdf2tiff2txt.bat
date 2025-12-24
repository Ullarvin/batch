@echo off

::Create Directories
if not exist "%CD%\output" mkdir "%CD%\output"
if not exist "%CD%\output\txt" mkdir "%CD%\output\txt"

::Loop through all pdf files and convert to tif
for %%f in ("%CD%\*.pdf") do (
    magick "%%f" -quality 100 -scene 1 "%CD%/output/%%~nf-%%d.tif"
    @echo "%%f"
)

::Loop through all tifs and extract txt using tesseract into individual txt files and a master file
for %%f in ("%CD%\output\*.tif") do (

    @echo "----------------------------------------------------------" >> "%CD%/output/master.txt"
    @echo %%f >> "%CD%/output/master.txt"
    @echo "----------------------------------------------------------" >> "%CD%/output/master.txt"
    tesseract "%%f" stdout >> "%CD%/output/master.txt"
    tesseract "%%f" stdout > "%CD%/output/txt/%%~nf.txt"
    @echo "" >> "%CD%/output/master.txt"
    @echo "" >> "%CD%/output/master.txt"
    @echo "%%f"
)