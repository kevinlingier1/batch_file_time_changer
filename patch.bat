@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

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
::start /wait C:\"Program Files"\"Grass Valley"\"EDIUS 7"\edius_Loader.exe

::uitvoeren script

::start /w wordpad
start C:\"Program Files"\"Grass Valley"\"EDIUS 7"\edius_Loader.exe
start /w notepad
:LOOP
tasklist | find /i "notepad" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  ::ECHO Edius is nog actief
  Timeout /T 5 /Nobreak
  GOTO LOOP
)

:CONTINUE


:: einde uitvoeren script
::pause

date %CDATE%

::echo date changed back to %date%
::pause
exit
