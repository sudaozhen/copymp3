@echo off
md D:\mp3 2>nul
SetLocal EnableDelayedExpansion
echo ����ȫ������Mp3�����Ƶ�D:\mp3,�ų�D:\mp3���mp3
for /f "delims=\" %%i in ('fsutil fsinfo drives^|find /v ""') do (
set "var=%%i"
set "drive=!var:~-2!"
fsutil fsinfo drivetype !drive!|find "�̶�">nul &&call:slz "!drive!"
)
echo ���������&pause

:slz
if "%~1"=="" goto:eof
for /f "delims=" %%a in ('dir/s/b/a-d "%~1\*.mp3" 2^>nul') do (
set "var=%%a"
set "var=!var:~0,6!"
if /i not "!var!"=="d:\mp3" xcopy /y/h/r "%%a" "d:\mp3\"
)
goto:eof 