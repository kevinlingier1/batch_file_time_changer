@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:

@echo off
for /f "tokens=2 delims=/ " %%a in ('date /T') do set day=%%a
for /f "tokens=3 delims=/ " %%b in ('date /T') do set month=%%b
for /f "tokens=4 delims=/ " %%c in ('date /T') do set year=%%c

set CDATE=%day%-%month%-%year%

::echo date of today %date%

::pause
date 5/6/2015
::echo date changed to %date%
START /W notepad

::pause

date %CDATE%

::echo date changed back to %date%
::pause



