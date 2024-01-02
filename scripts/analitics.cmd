@echo off
set "dir_atual=%~dp0"
set systemdata="%dir_atual%data\systeminfo.txt"
set dadosJson="%dir_atual%data\dados.json"

systeminfo > %systemdata%

set NomeHost=
for /F "tokens=2 delims=:" %%a in ('findstr /C:"Nome do host" %systemdata%') do set "NomeHost=%%a"

set NomeSistema=
for /F "tokens=2 delims=:" %%a in ('findstr /C:"Nome do sistema operacional" %systemdata%') do set "NomeSistema=%%a"

set FabricanteSistema=
for /F "tokens=2 delims=:" %%a in ('findstr /C:"Fabricante do sistema operacional" %systemdata%') do set "FabricanteSistema=%%a"

set ModeloSistema=
for /F "tokens=2 delims=:" %%a in ('findstr /C:"Modelo do sistema" %systemdata%') do set "ModeloSistema=%%a"

set TipoSistema=
for /F "tokens=2 delims=:" %%a in ('findstr /C:"Tipo de sistema" %systemdata%') do set "TipoSistema=%%a"

set Processador=
for /F "tokens=2 delims=:" %%a in ('findstr /C:"Processador(es)" %systemdata%') do set "Processador=%%a"

set loc=
for /F "tokens=2 delims=:" %%a in ('findstr /C:"Localidade do sistema" %systemdata%') do set "loc=%%a"

(
    echo {
    echo     "usuario": "%USERNAME%",
    echo     "COMPUTERNAME": "%COMPUTERNAME%",
    echo     "NomeHost": "%NomeHost%",
    echo     "NomeSistema operacional": "%NomeSistema%",
    echo     "FabricanteSistema operacional": "%FabricanteSistema%",
    echo     "ModeloSistema": "%ModeloSistema%",
    echo     "TipoSistema": "%TipoSistema%",
    echo     "Processador": "%Processador%",
    echo     "LocalidadeSistema": "%loc%"
    echo }
) > %dadosJson%

curl -X POST -# -H "Content-Type: application/json;charset=utf-8" -H "Authorization: snve072509&Aplication" -T %dadosJson% https://pingobras-sg.glitch.me/global/database/1
exit