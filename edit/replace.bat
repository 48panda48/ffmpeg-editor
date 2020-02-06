@echo off
IF [%6]==[help] GOTO help
GOTO main
:help
echo usage:VIDEO1 VIDEO2 TIME1 TIME2 OUTPUT
echo (ONLY USE WITH SYNCED VIDEOS) replaces the time between time 1&2 with video2
GOTO end
:main
ffmpeg -ss 00:00:00 -t %3 -i "%~f1" -acodec copy -vcodec copy temp1.mp4
ffmpeg -ss %3 -to %4 -i "%~f2" -acodec copy -vcodec copy temp2.mp4
ffmpeg -ss %4 -i "%~f1" -acodec copy -vcodec copy temp3.mp4
copy NUL concat.txt
@echo file '%~dp1temp1.mp4' >concat.txt
@echo file '%~dp1temp2.mp4' >>concat.txt
@echo file '%~dp1temp3.mp4' >>concat.txt
ffmpeg -f concat -safe 0 -i concat.txt -c copy "%~f5"
del temp1.mp4
del temp2.mp4
del temp3.mp4
:end
GOTO end2
:end2
