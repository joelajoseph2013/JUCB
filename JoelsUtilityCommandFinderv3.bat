@echo off
title Joel's Windows Utility Suite - Outlicious Edition
color 0A

:: Setup
set "configFile=%~dp0settings.ini"
if not exist "%configFile%" (
    call :setup
)

:: Load Config
for /f "tokens=1,2 delims==" %%a in ('type "%configFile%"') do set "%%a=%%b"

:mainmenu
cls
echo.
echo ================================
echo  Welcome, %USERNAME_SET%!         
echo  Joel's Utility CLI Suite because windows keeps things a secret from us dont be scared to use run next time    
echo  [Joel Script Legacy Industries]        
echo  [Version 0.0.2 Alpha Patch Stage]
echo ================================
echo.
echo  1. Clean Temp and Cache Files
echo  2. Run Hidden Windows Tools
echo  3. System Health Check
echo  4. Easter Eggs
echo  5. Reset User Setup
echo  0. Exit
echo.
set /p choice=Select an option:

if "%choice%"=="1" goto cleanTemp
if "%choice%"=="2" goto hiddenTools
if "%choice%"=="3" goto systemCheck
if "%choice%"=="4" goto easterEggs
if "%choice%"=="5" goto setup
if "%choice%"=="0" exit
goto mainmenu

:: ========================
:setup
cls
echo Initial Setup:
set /p USERNAME_SET=Enter your name: 
echo USERNAME_SET=%USERNAME_SET%> "%configFile%"
goto mainmenu

:: ========================
:cleanTemp
cls
echo Cleaning Temporary Files...
echo.

echo [%temp%] - User Temp
del /q /f /s "%temp%\*.*"
echo Done clearing %temp%

echo [C:\Windows\Temp] - System Temp
del /q /f /s "C:\Windows\Temp\*.*"
echo Done clearing C:\Windows\Temp

echo [Prefetch] - App launch caching
del /q /f /s "C:\Windows\Prefetch\*.*"
echo Done clearing Prefetch

pause
goto mainmenu

:: ========================
:hiddenTools
cls
echo Hidden Windows Tools Menu
echo.
echo 1. Windows Defender Quick Scan
echo 2. Windows Malicious Software Removal Tool
echo 3. System File Checker (sfc /scannow)
echo 4. DISM Health Restore
echo 5. Open God Mode Folder
echo 6. Open Winver (shows your windows version)
echo 7. Open msinfo32 (advanced system info)
echo 8. Open perfmon (performance monitor)
echo 9. Open resmon (resource monitor)
echo 10. Open gpedit.msc (Local Group Policy Editor)
echo 11. Open regedit (Registry Editor)
echo 12. Open perfmon /rel (better perfmon)
echo 13. Open mdsched (Boots into RAM to check whether your computer has memory issues or not)
echo 14. Open netplwiz (Honestly even i dont know what this does but as far as i remember it was autologin and they changed it)
echo 15. Open taskschd.msc (task scheduler)
echo 0. Back
echo.
set /p tool=Choose a tool:

if "%tool%"=="1" (
    start cmd /k "PowerShell -Command Start-MpScan -ScanType QuickScan"
    goto mainmenu
)
if "%tool%"=="2" (
    start mrt
    goto mainmenu
)
if "%tool%"=="3" (
    sfc /scannow
    pause
    goto mainmenu
)
if "%tool%"=="4" (
    DISM /Online /Cleanup-Image /RestoreHealth
    pause
    goto mainmenu
)
if "%tool%"=="5" (
    mkdir "%userprofile%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
    echo God Mode folder added to Desktop.
    pause
    goto mainmenu
)
if "%tool%"=="6" (
    start winver
    goto mainmenu
)
if "%tool%"=="7" (
    start msinfo32
    goto mainmenu
)
if "%tool%"=="8" (
    start perfmon
    goto mainmenu
)
if "%tool%"=="9" (
    start resmon
    goto mainmenu
)
if "%tool%"=="10" (
    start gpedit.msc
    goto mainmenu
)
if "%tool%"=="11" (
    start regedit
    goto mainmenu
)
if "%tool%"=="12" (
    start perfmon /rel
    goto mainmenu
)
if "%tool%"=="13" (
    start mdsched
    goto mainmenu
)
if "%tool%"=="14" (
    start netplwiz
    goto mainmenu
)
if "%tool%"=="15" (
    start taskschd.msc
    goto mainmenu
)
if "%tool%"=="0" goto mainmenu
goto hiddenTools

:: ========================
:systemCheck
cls
echo Performing Basic System Checkup...
echo.

echo Checking if System Restore is enabled...
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v RPSessionInterval
echo.

echo Checking startup programs...
wmic startup get caption, command

echo.
pause
goto mainmenu

:: ========================
:easterEggs
cls
set /a rand=%random%%%3
if "%rand%"=="0" (
    echo "Fun Fact: You can type 'optionalfeatures' in Run to access hidden Windows features!"
)
if "%rand%"=="1" (
    echo "Joke: Why did the programmer quit his job? Because he didn't get arrays!"
)
if "%rand%"=="2" (
    start iexplore https://www.youtube.com/watch?v=dQw4w9WgXcQ
    echo You're welcome.
)

pause
goto mainmenu
