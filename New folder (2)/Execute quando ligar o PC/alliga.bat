@echo off
color b

:: Limpeza de arquivos temporários do sistema
echo Limpando arquivos temporários do sistema...

:: Limpar arquivos temporários no diretório %temp%
del /s /f /q "%temp%\*.*"
rd /s /q "%temp%"
md "%temp%"

:: Limpar arquivos temporários no diretório C:\Windows\Temp
del /s /f /q "C:\Windows\Temp\*.*"
rd /s /q "C:\Windows\Temp"
md "C:\Windows\Temp"

:: Limpar arquivos no diretório C:\Windows\Prefetch
del /s /f /q "C:\Windows\Prefetch\*.*"
rd /s /q "C:\Windows\Prefetch"
md "C:\Windows\Prefetch"

:: Limpar arquivos temporários no diretório Config~1\Temp
del /f /s /q "%HOMEPATH%\Config~1\Temp\*.*"
rd /s /q "%HOMEPATH%\Config~1\Temp"
md "%HOMEPATH%\Config~1\Temp"

:: Limpeza de arquivos temporários adicionais
deltree /y "C:\Windows\Tempor~1"
deltree /y "C:\Windows\Temp"
deltree /y "C:\Windows\Tmp"
deltree /y "C:\Windows\ff*.tmp"
deltree /y "C:\Windows\History"
deltree /y "C:\Windows\Cookies"
deltree /y "C:\Windows\Recent"
deltree /y "C:\Windows\Spool\Printers"

:: Excluir o arquivo WIN386.SWP
del /f "C:\WIN386.SWP"

:: Limpeza de logs de eventos
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo.
echo Logs de eventos limpos! ^<pressione qualquer tecla^>
goto theEnd

:do_clear
echo Limpando %1
wevtutil.exe cl %1
goto :eof

:noAdmin
echo Você precisa executar este script como Administrador!
pause
cls

:: Continuar com a limpeza de arquivos temporários nos perfis de usuários e navegadores

:: Iniciar a limpeza dos perfis dos usuários
set profiles=%USERPROFILE%

:: Limpeza de cookies e arquivos temporários nos perfis de usuários
for /f "tokens=* delims= " %%u in ('dir /b/ad') do (

cls
title Deletando %%u COOKIES. . .
if exist "%profiles%%%u\cookies" echo Deletando....
if exist "%profiles%%%u\cookies" cd "%profiles%%%u\cookies"
if exist "%profiles%%%u\cookies" del . /F /S /Q /A: R /A: H /A: A

cls
title Deletando %%u Temp Files. . .
if exist "%profiles%%%u\Local Settings\Temp" echo Deletando....
if exist "%profiles%%%u\Local Settings\Temp" cd "%profiles%%%u\Local Settings\Temp"
if exist "%profiles%%%u\Local Settings\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\Local Settings\Temp" rmdir /s /q "%profiles%%%u\Local Settings\Temp"

cls
title Deletando %%u Temp Files. . .
if exist "%profiles%%%u\AppData\Local\Temp" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Temp" cd "%profiles%%%u\AppData\Local\Temp"
if exist "%profiles%%%u\AppData\Local\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Temp" rmdir /s /q "%profiles%%%u\AppData\Local\Temp"

cls
title Deletando %%u Temporary Internet Files. . .
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" echo Deletando....
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" cd "%profiles%%%u\Local Settings\Temporary Internet Files"
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\Local Settings\Temporary Internet Files" rmdir /s /q "%profiles%%%u\Local Settings\Temporary Internet Files"

cls
title Deletando %%u Temporary Internet Files. . .
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" cd "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" rmdir /s /q "%profiles%%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"

cls
title Deletando %%u WER Files. . .
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" cd "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" rmdir /s /q "%profiles%%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"

:: Limpeza de outros diretórios temporários
cls
title Deletando %Systemroot%\Temp
if exist "%Systemroot%\Temp" echo Deletando....
if exist "%Systemroot%\Temp" cd "%Systemroot%\Temp"
if exist "%Systemroot%\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%Systemroot%\Temp" rmdir /s /q "%Systemroot%\Temp"

cls
title Deletando %SYSTEMDRIVE%\Temp
if exist "%SYSTEMDRIVE%\Temp" echo Deletando....
if exist "%SYSTEMDRIVE%\Temp" cd "%SYSTEMDRIVE%\Temp"
if exist "%SYSTEMDRIVE%\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%SYSTEMDRIVE%\Temp" rmdir /s /q "%Systemroot%\Temp"

:: Limpeza nos navegadores (Firefox, Chrome, Edge, Opera, Vivaldi, Brave)
cls
title Deletando %%u FIREFOX TEMP. . .
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" cd "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles"
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles" rmdir /s /q "%profiles%%%u\AppData\Local\Mozilla\Firefox\Profiles"

cls
title Deletando %%u CHROME TEMP. . .
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" echo Deletando....
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" cd "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" rmdir /s /q "%profiles%%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"

cls
title Deletando %%u EDGE TEMP. . .
if exist "%profiles%%%u\AppData\Local\Microsoft
