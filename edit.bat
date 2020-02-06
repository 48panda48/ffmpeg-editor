@echo off
IF [%1]==[cut] GOTO cut
IF [%1]==[combine] GOTO combine
IF [%1]==[remove] GOTO remove
IF [%1]==[sync] GOTO sync
IF [%1]==[replacesync] GOTO replacesync
IF [%1]==[replace] GOTO replace
IF [%1]==[help] GOTO help
echo No Valid command %1. do "edit help" to get a list of commands.
GOTO end
:cut
"edit\cutvideos.bat" "%~f2" %3 "%~f4"
GOTO end
:combine
"edit\mergevideos.bat" "%~f2" "%~f3" "%~f4"
GOTO end
:remove
"edit\removepart.bat" "%~f2" %3 %4 "%~f5"
GOTO end
:sync
"edit\sync.bat" "%~f2" %3 "%~f4" %5
GOTO end
:replacesync
"edit\replace.bat" "%~f2" "%~f3" %4 %5 "%~f6"
GOTO end
:replace
"edit\replacepro.bat" "%~f2" %3 %4 "%~f5" " %~f6"
GOTO end
:help
IF [%2]==[cut] GOTO cuthelp
IF [%2]==[combine] GOTO combinehelp
IF [%2]==[remove] GOTO removehelp
IF [%2]==[sync] GOTO synchelp
IF [%2]==[replacesync] GOTO replacesynchelp
IF [%2]==[replace] GOTO replacehelp
echo List of commands:
echo cut -- cut video
echo combine -- combine video
echo remove -- remove middle section of video
echo sync-- sync two videos
echo replacesync -- (ONLY IF SYNCED) replace middle secion of one video with another
echo replace -- replace middle secion of one video with another
GOTO end
:cuthelp
"edit\cutvideos.bat" 1 1 1 help
GOTO hend
:combinehelp
"edit\mergevideos.bat" 1 1 1 help
GOTO hend
:removehelp
"edit\removepart.bat" 1 1 1 1 help
GOTO hend
:synchelp
"edit\sync.bat" 1 1 1 1 help
GOTO hend
:replacesynchelp
"edit\replace.bat" 1 1 1 1 1 help
GOTO hend
:replacehelp
"edit\replacepro.bat" 1 1 1 1 1 1 help
GOTO hend
:hend
echo Time Format: HH:MM:SS
:end
