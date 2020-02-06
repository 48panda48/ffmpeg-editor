@echo off
IF [%4]==[help] GOTO help
GOTO main
:help
echo usage:VIDEO1 VIDEO2 OUTPUT
echo makes output video1 + video2
GOTO end
:main
copy NUL concat.txt
@echo file '%~f1' >concat.txt
@echo file '%~f2' >>concat.txt
ffmpeg -f concat -safe 0 -i concat.txt -c copy "%~f3"
:end
GOTO end2
:end2
