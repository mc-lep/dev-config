@echo off

set configpath=%HOMEDRIVE%%HOMEPATH%\.config

echo Check if the config path exists ...

if not exist "%configpath%\" (
    mkdir "%configpath%"
)

echo Apply configuration files ...
xcopy /y /f /s "%~dp0\.config\*" "%configpath%\"

echo Apply Local AppData files ...
xcopy /y /f /s "%~dp0\local-appdata\*" "%LocalAppData%\"