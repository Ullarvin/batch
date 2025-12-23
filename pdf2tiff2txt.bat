@echo off

if not exist "%~dp0output" mkdir "%~dp0output"
if not exist "%~dp0output\txt" mkdir "%~dp0output\txt"
for %%f in (*.pdf) do (
    magick "%%f" -quality 100 "./output/%%~nf.tif"
)

cd output

for %%f in ("*.tif") do (

    @echo "----------------------------------------------------------" >> "./master.txt"
    @echo %%f >> "./master.txt"
    @echo "----------------------------------------------------------" >> "./master.txt"
    tesseract "%%f" stdout >> "./master.txt"
    tesseract "%%f" stdout > "./txt/%%~nf.txt"
    @echo "" >> "./master.txt"
    @echo "" >> "./master.txt"
)

cd ../