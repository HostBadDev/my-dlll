@ECHO OFF
title 
mode 30,13
color 0c
:menu
cls
echo [1] Limpar memoria
echo [2] Sair
set/p menu=">"
if %menu% equ 1 goto voltar
if %menu% equ 2 exit


:voltar
set a= °
cls
echo.
echo BAT PARA LIMPAR A MEMORIA RAM!
echo.
set n=0

echo.
:limpa
echo.
ECHO -----------PASSANDO.RODO-----------
ECHO.
echo.
echo.
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
del /s /f /q c:\windows\temp\*.*
del /s /f /q  c:\windows\prefetch\*.*
del /s /f /q  c:\windows\Downloaded Program Files\*.*
del /s /f /q  c:\windows\Installer\*.*
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
cls