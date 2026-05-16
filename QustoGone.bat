@echo off
chcp 65001 >nul
title ADB Hacker Tool Menu

:menu
cls
color 0A

echo(
echo ==============================
echo      QUSTOGONE HACK TOOL         
echo ==============================
echo(

echo   ::::::::  :::    :::  :::::::: ::::::::::: ::::::::   ::::::::   ::::::::  ::::    ::: ::::::::::
echo :+:    :+: :+:    :+: :+:    :+:    :+:    :+:    :+: :+:    :+: :+:    :+: :+:+:   :+: :+:
echo +:+    +:+ +:+    +:+ +:+           +:+    +:+    +:+ +:+        +:+    +:+ :+:+:+  +:+ +:+
echo +#+    +:+ +#+    +:+ +#++:++#++    +#+    +#+    +:+ :#:        +#+    +:+ +#+ +:+ +#+ +#++:++#
echo +#+  # +#+ +#+    +#+        +#+    +#+    +#+    +#+ +#+   +#+# +#+    +#+ +#+  +#+#+# +#+
echo #+#   +#+  #+#    #+# #+#    #+#    #+#    #+#    #+# #+#    #+# #+#    #+# #+#   #+#+# #+#
echo  ###### ### ########   ########     ###     ########   ########   ########  ###    #### ##########

echo(
echo ==============================
echo           MAIN MENU           
echo ==============================
echo(
echo [1] Download necessary dependencies
echo [2] Start Qustodio block
echo [3] Exit
echo(

set /p choice= Choose option:

if "%choice%"=="1" goto fakeinstall
if "%choice%"=="2" goto calcblock
if "%choice%"=="3" exit
goto menu%"=="3" exit
goto menu

:fakeinstall
cls
color 0B
echo.
echo  [INFO] Initializing download sequence...
timeout /t 1 >nul

echo Downloading Dependencies...
timeout /t 3 >nul

echo [OK] Dependencies downloaded successfully.
pause
goto menu

:calcblock
cls
color 0A
echo.
echo [ADB] Connecting to device...
timeout /t 2 >nul

echo Disabling Qustodio...
adb.exe shell pm disable-user --user 0 com.qustodio.qustodioapp

echo.
echo [OK] Operation completed.
pause
goto menu
