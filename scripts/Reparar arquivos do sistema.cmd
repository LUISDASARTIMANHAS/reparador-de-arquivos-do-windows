@echo off
set "dir_atual=%~dp0"

start "" "%dir_atual%\messages\createMessages.cmd"
cscript "%dir_atual%\messages\messageStart.vbs"

SFC /SCANNOW
Dism /Online /Cleanup-image /RestoreHealth

cscript "%dir_atual%\messages\messageConcluido.vbs"
cscript "%dir_atual%\messages\messageReiniciar.vbs"

shutdown -r -t 5 -c "Reiniciando em 5 segundos"

exit