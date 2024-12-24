 @echo off
color 
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q C:\Windows\SoftwareDistribution\Download
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
deltree /y c:\windows\downloaded program files
del c:\WIN386.SWP
cls

msg * Creditos a KLx FF