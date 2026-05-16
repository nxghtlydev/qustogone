@echo off
chcp 65001 >nul
title Qustodio Tool Menu
color 0A

:: =========================
:: ADMIN CHECK
:: =========================
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo ======================================
    echo  ADMIN PRIVILEGES REQUIRED
    echo  Please run as Administrator
    echo ======================================
    pause
    exit
)

:: =========================
:: BOOT SEQUENCE
:: =========================
cls
echo Initializing system...
timeout /t 1 >nul

echo Loading kernel modules...
timeout /t 1 >nul

echo Starting secure interface...
timeout /t 1 >nul

echo Establishing connection...
timeout /t 1 >nul

echo SYSTEM READY
timeout /t 1 >nul

:: =========================
:: MENU
:: =========================
:menu
cls
color 0A

echo   ::::::::  :::    :::  :::::::: ::::::::::: ::::::::   ::::::::   ::::::::  ::::    ::: ::::::::::
echo :+:    :+: :+:    :+: :+:    :+:    :+:    :+:    :+: :+:    :+: :+:    :+: :+:+:   :+: :+:
echo +:+    +:+ +:+    +:+ +:+           +:+    +:+    +:+ +:+        +:+    +:+ :+:+:+  +:+ +:+
echo +#+    +:+ +#+    +:+ +#++:++#++    +#+    +#+    +:+ :#:        +#+    +:+ +#+ +:+ +#+ +#++:++#
echo +#+  # +#+ +#+    +#+        +#+    +#+    +#+    +#+ +#+   +#+# +#+    +#+ +#+  +#+#+# +#+
echo #+#   +#+  #+#    #+# #+#    #+#    #+#    #+#    #+# #+#    #+# #+#    #+# #+#   #+#+# #+#
echo  ###### ### ########   ########     ###     ########   ########   ########  ###    #### ##########

echo ======================================
echo           QUSTOGONE TOOL
echo ======================================
echo.
echo   1 - Download dependencies
echo   2 - Stop Qustodio process
echo   3 - Delete Qustodio process
echo   4 - Exit
echo.

set /p choice=Select option: 

if "%choice%"=="1" goto fake
if "%choice%"=="2" goto calc
if "%choice%"=="3" goto nuke
if "%choice%"=="4" exit
goto menu

:: =========================
:: FAKE DOWNLOAD
:: =========================
:fake
cls
color 0B
echo Downloading dependencies...
timeout /t 3 >nul
echo Done.
pause
goto menu

:nuke
 SET /P delete= Do you want to continue? (Y/N)
 IF "%delete%"=="Y" goto :delete
 goto menu
 
 :delete
 sc config qengine start= disabled
 sc config qupdate start= disabled
 net stop qengine
 net stop qupdate
 sc delete qengine
 sc delete qupdate
 goto menu
 

:: =========================
:: CALC KILL
:: =========================
:calc
cls
color 0C

echo WARNING: This will stop your internet connexion
echo.
set /p confirm=Type YES to continue: 

if /i not "%confirm%"=="YES" goto menu

echo.
echo Terminating calc.exe...
timeout /t 2 >nul

sc config qengine start= disabled
sc config qupdate start= disabled
net stop qengine
net stop qupdate
taskkill /f /im qvra.exe >nul 2>&1

echo Done.
pause
goto menu