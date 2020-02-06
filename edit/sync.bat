@echo off
IF [%5]==[help] GOTO help
GOTO main
:help
echo USAGE: VIDEO1 TIME1 VIDEO2 TIME2
echo a video and a time of a significant event, and another video with the time of the same event in that one.
echo will cut some of one video, so that they are aligned.
GOTO end
:main
python dist.py %2 %4> temp.txt
set /p OUT=<temp.txt
python isbigger.py %2 %4> temp.txt
set /p OUT2=<temp.txt
IF [%OUT2%]==[1] GOTO one
SET /P AREYOUSURE=Are you sure, This will remove the first %OUT% secs of %1 (Y/N)
IF /I "%AREYOUSURE%" NEQ "Y" GOTO end
ffmpeg -ss %OUT% -i "%~f1" -acodec copy -vcodec copy "%~n1"synced.mp4
GOTO end
:one
SET /P AREYOUSURE=Are you sure, This will remove the first %OUT% secs of %3 (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO end
ffmpeg -ss %OUT% -i "%~f3" -acodec copy -vcodec copy "%~n3"synced.mp4
:end
GOTO end2
:end2
