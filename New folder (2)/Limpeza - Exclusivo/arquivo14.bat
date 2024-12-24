sc stop AJRouter > nul
sc config AJRouter start= disabled > nul

sc stop tzautoupdate > nul
sc config tzautoupdate start= disabled > nul

sc stop BITS > nul
sc config BITS start= disabled > nul

sc stop DiagTrack > nul
sc config DiagTrack start= disabled > nul
 
sc stop CDPSvc > nul
sc config CDPSvc start= disabled > nul

sc stop DusmSvc > nul
sc config DusmSvc start= disabled > nul

sc stop DoSvc > nul
sc config DoSvc start= disabled > nul

sc stop diagsvc > nul
sc config diagsvc start= disabled > nul

sc stop DPS > nul
sc config DPS start= disabled > nul

sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

sc stop WdiSystemHost > nul
sc config WdiSystemHost start= disabled > nul

sc stop dmwappushservice > nul
sc config dmwappushservice start= disabled > nul

sc stop DisplayEnhancementService > nul
sc config DisplayEnhancementService start= disabled > nul

sc stop MapsBroker > nul
sc config MapsBroker start= disabled > nul

sc stop fhsvc > nul
sc config fhsvc start= disabled > nul

sc stop lfsvc > nul
sc config lfsvc start= disabled > nul

sc stop HomeGroupListener > nul
sc config HomeGroupListener start= disabled > nul

sc stop HomeGroupProvider > nul
sc config HomeGroupProvider start= disabled > nul

sc stop SmsRouter > nul
sc config SmsRouter start= disabled > nul

sc stop CscService > nul
sc config CscService start= disabled > nul

sc stop SEMgrSvc > nul
sc config SEMgrSvc start= disabled > nul

sc stop pla > nul
sc config pla start= disabled > nul

sc stop PhoneSvc > nul
sc config PhoneSvc start= disabled > nul

sc stop WpcMonSvc > nul
sc config WpcMonSvc start= disabled > nul

sc stop RasAuto > nul
sc config RasAuto start= disabled > nul

sc stop RasMan > nul
sc config RasMan start= disabled > nul 

sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

sc stop TermService > nul
sc config TermService start= disabled > nul

sc stop TermService > nul
sc config TermService start= disabled > nul
 
sc stop RpcLocator > nul
sc config RpcLocator start= disabled > nul

sc stop RemoteRegistry > nul
sc config RemoteRegistry start= disabled > nul
 
sc stop RetailDemo > nul
sc config RetailDemo start= disabled > nul

sc stop SysMain > nul 
sc config SysMain start= disabled > nul

sc stop WalletService > nul
sc config WalletService start= disabled > nul

sc stop WerSvc > nul
sc config WerSvc start= disabled > nul

sc stop WSearch > nul
sc config WSearch start= disabled > nul
 
sc stop W32Time > nul 
sc config W32Time start= disabled > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 00000004 /f > nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpnUserService" /v Start /t REG_DWORD /d 00000004 /f > nul

goto :exit
