@echo off
setlocal EnableDelayedExpansion

rem Set the directory path where the input files are located
set "input_path=E:\Github\Text-to-MP4\Files"

rem Set the directory path where the output files should be saved
set "output_dir=E:\Github\Text-to-MP4\Output"

rem Create the output directory if it doesn't already exist
if not exist "%output_dir%" (
  mkdir "%output_dir%"
)

rem Loop through all the .txt files in the input directory
for %%i in ("%input_path%\*.txt") do (

  rem Get the file name without extension
  set "file_name=%%~ni"
  
  rem Set the output directory path with the file name
  set "output_path=%output_dir%\!file_name!"
  
  rem Run the Python command with the current input file and output directory
  python E:/Github/tortoise-tts/tortoise/read.py --voice stephenfry --text "%%~i" --preset ultra_fast --seed 1684581035 --output_path "!output_path!"

  rem Move the text file somewhere else
  move "%%i" "%output_dir%\"
)

rem Pause the script so that it doesn't immediately close when finished
pause