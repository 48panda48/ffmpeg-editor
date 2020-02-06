@echo off
IF [%7]==[help] GOTO help
GOTO main
:help
echo usage:VIDEO1 TIME1 TIME2 VIDEO2 TIME3 OUTPUT
echo usage:is video1 up to time1 then shows video2 at time3 until time2 is hit, where video1 is shown
GOTO end
:main
python dist.py %2 %3> temp.txt
set /p OUT=<temp.txt
ffmpeg -ss 00:00:00 -t %2 -i "%~f1" -acodec copy -vcodec copy temp1.mp4
ffmpeg -ss %5 -t %OUT% -i "%~f4" -acodec copy -vcodec copy temp2.mp4
ffmpeg -ss %3 -i "%~f1" -acodec copy -vcodec copy temp3.mp4
copy NUL concat.txt
@echo file '%~dp1temp1.mp4' >concat.txt
@echo file '%~dp1temp2.mp4' >>concat.txt
@echo file '%~dp1temp3.mp4' >>concat.txt
ffmpeg -f concat -safe 0 -i concat.txt -c copy "%~f6"
del temp1.mp4
del temp2.mp4
del temp3.mp4
:end
GOTO end2
:end2
EXIT
ffmpeg -i ep1.mp4 -i ep2.webbm -filter_complex "[0]crop=iw/2:ih:0:0, pad=iw*2:ih[left]; [1]crop=iw/2:ih:iw/2:0[right]; [left][right]overlay=w" out555.mp4