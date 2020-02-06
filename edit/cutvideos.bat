@echo off
if [%4]==[help] GOTO help
GOTO main
:help
echo Usage:Video Time output
echo returns 2 videos(before,after), with the pivot point at the time specified.
GOTO end
:main
ffmpeg -ss 00:00:00 -t %2 -i "%~f1" -acodec copy -vcodec copy "%~n3"before.mp4
ffmpeg -ss %2 -i "%~f1" -acodec copy -vcodec copy "%~n3"after.mp4
:end
GOTO end2
:end2
