@echo off
set strength=%3
IF [%1]==[set] GOTO setkey
IF [%1]==[preset] GOTO get
IF [%1]==[RGB] GOTO RGB
:RGB
set color=%2
GOTO main
:setkey
echo %2 %3
GOTO end
:get
FOR /F "tokens=* USEBACKQ" %%F IN (`FINDSTR "%2" colorconfig.txt`) DO (
SET var=%%F
)
for /f "tokens=2" %%i in ("%var%") do set color=%%i
:main
ffmpeg -i "%4" -i "%~f5" -shortest -filter_complex "[1:v]chromakey=0x%color%:%strength%:0.2[ckout];[0:v][ckout]overlay[out]" -map "[out]" %~f6
:end
