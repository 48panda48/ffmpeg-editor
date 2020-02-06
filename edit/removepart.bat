@echo off
IF [%5]==[help] GOTO help
GOTO main
:help
echo usage:VIDEO TIME1 TIME2 OUTPUT
echo The 2 times are the start and end times of the part to remove
GOTO end
:main
ffmpeg -ss 00:00:00 -t %2 -i "%~f1" -acodec copy -vcodec copy temp1.mp4
ffmpeg -ss %3 -i "%~f1" -acodec copy -vcodec copy temp2.mp4
copy NUL concat.txt
@echo file temp1.mp4 >concat.txt
@echo file temp2.mp4 >>concat.txt
ffmpeg -f concat -safe 0 -i concat.txt -c copy "%~f4"
del temp1.mp4
del temp2.mp4
:end
GOTO end2
:end2
