@echo off
md D:\mp3 2>nul
SetLocal EnableDelayedExpansion
echo 正在全盘搜索Mp3并复制到D:\mp3,排除D:\mp3里的mp3
for /f "delims=\" %%i in ('fsutil fsinfo drives^|find /v ""') do (
set "var=%%i"
set "drive=!var:~-2!"
fsutil fsinfo drivetype !drive!|find "固定">nul &&call:slz "!drive!"
)
echo 任务已完成&pause

:slz
if "%~1"=="" goto:eof
for /f "delims=" %%a in ('dir/s/b/a-d "%~1\*.mp3" 2^>nul') do (
set "var=%%a"
set "var=!var:~0,6!"
if /i not "!var!"=="d:\mp3" xcopy /y/h/r "%%a" "d:\mp3\"
)
goto:eof 