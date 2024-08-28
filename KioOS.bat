@echo off
title KioOS Management Script

:menu
cls
echo ================================
echo          KioOS - MENU
echo ================================
echo 1. Instalacja KioOS
echo 2. Uruchom KioOS
echo 3. Dodaj aplikację
echo 4. Restart systemu
echo 5. Zakończ
echo ================================
set /p choice="Wybierz opcję (1-5): "

if "%choice%"=="1" goto install
if "%choice%"=="2" goto start_os
if "%choice%"=="3" goto add_app
if "%choice%"=="4" goto restart_system
if "%choice%"=="5" goto exit

goto menu

:install
echo Instalacja KioOS...
echo Tworzenie struktury katalogow...
mkdir C:\KioOS
mkdir C:\KioOS\bin
mkdir C:\KioOS\apps
echo Kopiowanie plikow systemowych...
xcopy .\system_files\* C:\KioOS\ /s /e /i /h /y
echo Instalacja zakonczona.
pause
goto menu

:start_os
echo Uruchamianie KioOS...
echo Startowanie interfejsu KioOS...
start C:\KioOS\bin\KioOS_GUI.exe
echo KioOS uruchomiony.
pause
goto menu

:add_app
echo Dodawanie aplikacji...
set /p appname="Podaj nazwe aplikacji do zainstalowania (np. notepad): "
if "%appname%"=="notepad" (
    echo Instalowanie Notatnika...
    xcopy .\apps\notepad\* C:\KioOS\apps\notepad\ /s /e /i /h /y
    echo Aplikacja Notatnik zostala zainstalowana.
) else (
    echo Aplikacja %appname% nie jest dostepna.
)
pause
goto menu

:restart_system
echo Restartowanie systemu...
shutdown /r /t 5
goto menu

:exit
echo Wychodzenie...
pause
exit
