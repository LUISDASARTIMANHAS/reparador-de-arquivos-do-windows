@echo off
set "dir_atual=%~dp0"

start "Report e Analitcs para o servidor" "%dir_atual%\analitics.cmd"

start "" "%dir_atual%\messages\createMessages.cmd"
cscript "%dir_atual%\messages\messageStart.vbs"

SFC /SCANNOW
Dism /Online /Cleanup-image /RestoreHealth

cscript "%dir_atual%\messages\messageConcluido.vbs"
cscript "%dir_atual%\messages\messageReiniciar.vbs"


exit