@echo off
set in1="%~f1"
set in2="%~f2"
set horizontalRatio=%3/%4
set horizontalInvert=%4/%3
set verticalRatio=%5
ffmpeg -i %in1% -i %in2% -filter_complex "[0]crop=iw:ih:0:0, pad=iw:ih[left]; [1]crop=iw*%horizontalRatio%:ih*%verticalRatio%:iw*%horizontalRatio%:ih*0[right]; [left][right]overlay=w" "%~f6"