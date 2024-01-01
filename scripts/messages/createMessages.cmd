@echo off

echo MsgBox "Iniciando programa...", vbInformation + vbOKCancel, "Windows Start" > messageStart.vbs
echo MsgBox "Falha Detectada!", vbCritical + vbRetryCancel, "Windows Error" > messageError.vbs
echo MsgBox "Aviso!", vbExclamation + vbAbortRetryIgnore, "Windows Alert" > messageAlert.vbs
echo MsgBox "Info: ", vbInformation + vbOKOnly, "Windows Information" > messageInfo.vbs
echo MsgBox "Deseja continuar?", vbQuestion + vbYesNo, "Windows Question" > messageQuestion.vbs

echo MsgBox "Info: Reparacao dos arquivos concluida!", vbInformation + vbOKOnly, "Windows Information" > messageConcluido.vbs
echo MsgBox "Aviso! Vamos Reiniciar seu sistema para aplicar as configuracoes", vbExclamation + vbOKOnly, "Windows Alert" > messageReiniciar.vbs
exit