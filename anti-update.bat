@echo off
:: Definindo variaveis do ambiente
setlocal enabledelayedexpansion
color 71
set build=8.8.4
set date=12/abr/25
set ano=2025
set versao=Anti-Update do mal ver: %build% - %date%
set obrigado=Obrigado por desinstalar o %versao%
set hostsfile="%SystemRoot%\system32\drivers\etc\hosts"
::nesta linha abaixo serao definidos todos os endereços para bloqueio separados por ESPAÇO
::ESPAÇO é separador de itens.
::no caso de comentarios use "underline" ou "hifen" no lugar de espaços
set adobe_block=125.252.224.90 125.252.224.91 hl2rcv.adobe.com t3dns.adobe.com 3dns-1.adobe.com 3dns-2.adobe.com 3dns-3.adobe.com 3dns-4.adobe.com activate.adobe.com activate-sea.adobe.com activate-sjc0.adobe.com activate.wip.adobe.com activate.wip1.adobe.com activate.wip2.adobe.com activate.wip3.adobe.com activate.wip4.adobe.com adobe.activate.com adobe-dns.adobe.com adobe-dns-1.adobe.com adobe-dns-2.adobe.com adobe-dns-3.adobe.com adobe-dns-4.adobe.com adobeereg.com armdl.adobe.com ood.opsource.net practivate.adobe practivate.adobe.com tpractivate.adobe.newoa  practivate.adobe.ntp practivate.adobe.ipp ereg.adobe.com ereg.wip.adobe.com ereg.wip1.adobe.com ereg.wip2.adobe.com ereg.wip3.adobe.com ereg.wip4.adobe.com wip.adobe.com wip1.adobe.com wip2.adobe.com wip3.adobe.com wip4.adobe.com www.adobeereg.com www.wip.adobe.com www.wip1.adobe.com www.wip2.adobe.com www.wip3.adobe.com www.wip4.adobe.com
set autocad_block=autodesk.fi autodesk.de autodesk.es autodesk.ca autodesk.dk autodesk.pl ns1.autodesk.com ns2.autodesk.com ns3.autodesk.com a.gtld-servers.net b.gtld-servers.net c.gtld-servers.net d.gtld-servers.net e.gtld-servers.net f.gtld-servers.net g.gtld-servers.net h.gtld-servers.net i.gtld-servers.net j.gtld-servers.net k.gtld-servers.net l.gtld-servers.net ns1.autodesk.com m.gtld-servers.net adobeereg.com 126114-app1.autodesk.com 94175-app1.autodesk.com 94184-app2.autodesk.com 96579-lbal1.autodesk.com acamp.autodesk.com adeskdi3.autodesk.com adeskdmzpdc.autodesk.com adeskgate.autodesk.com adesknews2.autodesk.com adeskout.autodesk.com adsknateur.autodesk.com amernetlog.autodesk.com app5.autodesk.com aprimo-relay1.autodesk.com aprimo-relay2.autodesk.com aprimo-relay3.autodesk.com aprimo-relay4.autodesk.com autosketch.autodesk.com blues.autodesk.com cbuanprd.autodesk.com cbuanprhcllb.autodesk.com cbuanqa2lb.autodesk.com ci3dwsdev-svc.autodesk.com ci3dwsprd-svc.autodesk.com ci3dwsstg-svc.autodesk.com community.autodesk.com cut.autodesk.com cvsprd01.autodesk.com discussion.autodesk.com eur.autodesk.com extcidev.autodesk.com extciqa.autodesk.com extupg.autodesk.com ftp-users.autodesk.com ftp2b.autodesk.com gisdmzpdc.autodesk.com hqaribasrf04.autodesk.com hqmgwww01.autodesk.com hqmgwww04.autodesk.com hqmobileweb01.autodesk.com hqprxsrftrn.autodesk.com hqpsweb01.autodesk.com hubdev-svc.autodesk.com hubprd-svc.autodesk.com hubstg-svc.autodesk.com itappprd01-svc.autodesk.com itappprd02-svc.autodesk.com its.autodesk.com jdevextv-new.autodesk.com jp.autodesk.com jstgextv-new.autodesk.com jstgintv-new.autodesk.com lbsvzw.autodesk.com lbsvzw1.autodesk.com lbsvzw2.autodesk.com library.autodesk.com liveupdate.autodesk.com locationservices.autodesk.com lsctsol04.autodesk.com mail-relay.autodesk.com mneprdext-svc.autodesk.com mut.autodesk.com nbugma-dmz.autodesk.com ns1.autodesk.com ns2.autodesk.com ns3.autodesk.com ns4.autodesk.com ns5.autodesk.com nut.autodesk.com otw-new.autodesk.com otwdownloads.autodesk.com partnercenter.autodesk.com partnerproducts.autodesk.com paste.autodesk.com pedidrq.autodesk.com pediqrx.autodesk.com petars1.autodesk.com petcp11ia-2nat.autodesk.com petcr12ihsrp2.autodesk.com phxgciv.autodesk.com phxgciv_dr.autodesk.com planix3d.autodesk.com pointa.autodesk.com register.autodesk.com registerallied-pr.autodesk.com registeronce.autodesk.com salestraining.autodesk.com searchnews.autodesk.com shop.autodesk.com spamster-bulk.autodesk.com sswwwp.autodesk.com trialdownload.autodesk.com usa.autodesk.com uspetcr12ie_198.autodesk.com uspetcr12if.autodesk.com uspetcr12if_198.autodesk.com uspetcrs12ia_ib_vlan500_2_hsrp.autodesk.com uspetcrs12ia_vlan500_2.autodesk.com uspetcrs12ib_vlan500_2.autodesk.com uspetne06ia_ib_untrust_dip7.autodesk.com usrelay.autodesk.com ussclout1.autodesk.com vzwlpsrel.autodesk.com vzwlpstst.autodesk.com web.autodesk.com webservices.autodesk.com wormhole.autodesk.com www.autodesk.com www3.autodesk.com genuine-software.autodesk.com genuine-software2.autodesk.com
set corel_block=corel.com apps.corel.com mc.corel.com origin-mc.corel.com iws.corel.com ipm.corel.com 2.18.12.147 googletagmanager.com corelstore.com www.corelstore.com deploy.akamaitechnologies.com compute-1.amazonaws.com dev1.ipm.corel.public.corel.net ipp.corel.com
:: para uma lista de bloqueio mais efetiva consulte https://github.com/hagezi/dns-blocklists#native
set windows_block=mpa.one.microsoft.com sls.microsoft.com genuine.microsoft.com wat.microsoft.com mpa.microsoft.com searchclient.live.net office.microsoft.com watson.microsoft.com content.microsoft.com logging.microsoft.com windowsupdate.com download.windowsupdate.com download.microsoft.com ntservicepack.microsoft.com update.microsoft.com www.windowsupdate.com windowsupdate.microsoft.com www.windowsupdate.microsoft.com www.wustat.windows.com


:: Variaveis definidas
rename %~f0 "anti-update%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:: pasta $WinReAgent

:: Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script precisa ser executado como administrador.
    echo Reiniciando com privilégios de administrador...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~f0' -Verb RunAs"
    exit
)



:menuprincipal
set opcao=0
set vFlag_hosts=0
set vFlag_registro=0
set vFlag_completo=0
set GWX=GWX nao instalado
set RUXIM=RUXIM nao instalado
FIND /C /I "#%versao%" %hostsfile%
IF %ERRORLEVEL% NEQ 1 set instalado=esta instalado e atualizado.
IF %ERRORLEVEL% NEQ 0 set instalado=nao instalado ou esta desatualizado.

if exist "%systemroot%\system32\gwx\gwx.exe" set GWX=GWX instalado
if exist "%systemroot%\system32\gwx\antigwx_by-llbranco.txt" set GWX=PROTEGIDO CONTRA GWX
if "%gwx%"=="GWX instalado" (
color 4f
)

if exist "%programfiles%\RUXIM\DTUdriver.exe" set RUXIM=RUXIM instalado
if exist "%programfiles%\RUXIM\antiRUXIM_by-llbranco.txt" set RUXIM=PROTEGIDO CONTRA RUXIM
if "%RUXIM%"=="RUXIM instalado" (
color 4f
) 

cls
echo -------------------------------------------------------------------------------
echo    O %versao% %instalado%
echo 	%GWX%
echo 	%RUXIM%
echo https://github.com/llbranco/scripts
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2013
echo           O Anti-Update bloqueia atualizacao de: Windows, Corel e Adobe
echo -------------------------------------------------------------------------------
echo                               Selecione uma Opcao
echo -------------------------------------------------------------------------------
echo 1  - Instalar ou Atualizar o Bloqueio (Versao Completa)
echo 2  - Instalar ou Atualizar o Bloqueio (Apenas HOSTS)
echo 3  - Instalar ou Atualizar o Bloqueio (Apenas Registro)
echo 4  - Instalar ou Atualizar o Bloqueio (Apenas servicos)
echo 5  - Desistalar e Reverter ao original (Updates voltam a funcionar)
echo 6  - Sobre
echo 7  - Abrir HOSTS no Bloco de Notas
echo 8  - Remover GWX e RUXIM (Pop-up de update do WIN 11)
echo -------------------------------------------------------------------------------

echo.
 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 if "%opcao%"=="" goto fim
 If %opcao% equ 0 goto fim
 If %opcao% equ 1 goto antiupdatecompleto
 If %opcao% equ 2 goto antiupdatehosts
 If %opcao% equ 3 goto antiupdateregistro
 If %opcao% equ 4 goto antiupdateservicos 
 If %opcao% equ 5 goto antiupdateuninstall
 If %opcao% equ 6 goto antiupdatesobre
 If %opcao% equ 7 goto antiupdateverhosts
 if %opcao% equ 8 goto antiupdategwx
goto fim

:: Definindo vFlags
:antiupdatecompleto
set vFlag_completo=1
:: GWX só era instalado nos sistemas xp, vista, 7, 8 e 8.1
:: forçando um ads o usuario para instalar o windows 10 (get windows x/10)
if exist %systemroot%\system32\gwx\gwx.exe (
call %antiupdategwx%
) else (
echo %systemroot%\system32\gwx\gwx.exe nao encontrado
echo update kb3035583 APARENTEMENTE nao instalado
)
echo.
:: RUXIM / DTU DRIVER / Reusable UX Interaction Manager
:: é similar ao maldito GWX, e exibe pop-ups e ADS forçando o usuário a instalar o windows 11 
if exist %programfiles%\RUXIM\DTUdriver.exe (
call %antiupdategwx%
) else (
echo %programfiles%\RUXIM\DTUdriver.exe nao encontrado
echo update kb5001716 APARENTEMENTE nao instalado
)
pause
goto antiupdate_avancar

:antiupdatehosts
set vFlag_hosts=1
goto antiupdate_avancar

:antiupdateregistro
:: Desabilitar serviços do Windows Defender e relacionados (so funciona ate o win7)
tasklist | find /i "msmpeng.exe" >nul && echo ATENCAO: O Windows Defender esta em execucao!

echo Alterando o valor da chave Start para 4 para desativar os serviços do Windows Defender...

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f

echo Alteracoes concluídas. Reinicie o computador se necessario.

set vFlag_registro=1
goto antiupdate_avancar

:antiupdate_avancar
If %vFlag_hosts%==1 goto antiupdatehosts
If %vFlag_registro%==1 goto antiupdateregistro
If %vFlag_completo%==1 goto antiupdatehosts


:antiupdatehosts
::  Liberanco permissoes do arquivo 
echo liberando acesso ao arquivo HOSTS
::attrib -r -a -s -h %hostsfile%
icacls %hostsfile% /grant "%username%":F

::criando backup do hostsfile
if exist %hostsfile% (
   copy /y %hostsfile% "%hostsfile%.bak"
)



::  Cabeçalho do HOSTS 
echo resetando o hosts
(
echo #%versao%
echo 127.0.0.1 localhost
echo ::1       localhost
echo.
echo.
)>%hostsfile%

::  Adobe Block 
echo instalando o %versao% para Adobe Block
(
echo #%versao% -- inicio
echo.
echo.
echo #Adobe block - linhas abaixo
)>>%hostsfile%

for %%s in (%adobe_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)
for /l %%n in (30,1,125) do find /c /i "wwis-dubc1-vip%%n.adobe.com" %hostsfile%>nul||(echo.Adicionando "wwis-dubc1-vip%%n.adobe.com" ao arquivos hosts&echo.127.0.0.1 wwis-dubc1-vip%%n.adobe.com>>%hostsfile%||echo.Acesso negado gravando %%n!)

::  Corel Block 
echo instalando o %versao% para Corel Block
(
echo.
echo.
echo #Corel block - linhas abaixo
)>>%hostsfile%

for %%s in (%corel_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)


::  AutoCad Block 
echo instalando o %versao% para AutoCad Block
(
echo.
echo.
echo #AutoCad block - linhas abaixo
)>>%hostsfile%

for %%s in (%autocad_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)


::  Windows Block 
echo instalando o %versao% para Windows Block
(
echo.
echo.
echo #Windows block - linhas abaixo
)>>%hostsfile%


for %%s in (%windows_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)
:: finalizando 

(
echo.
echo.
echo #%versao% -- fim
)>>%hostsfile%

If %vFlag_hosts%==1 goto menuprincipal
If %vFlag_completo%==1 goto antiupdateregistro
goto menuprincipal

:antiupdateregistro
echo Modificando entradas do registro...
echo.

set REG_WINUPDATE="HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
set REG_SERVICES="HKLM\SYSTEM\CurrentControlSet\Services"

rem Definindo bloqueio de serviços via registro
for %%S in (SharedAccess wuauserv wscsvc) do (
    reg add "%REG_SERVICES%\%%S" /v "Start" /t REG_DWORD /d 4 /f
)

echo Definindo entradas propositalmente inválidas para proibir atualizações...
reg add %REG_WINUPDATE% /v "WUServer" /t REG_SZ /d "http://naoquerousarwindowsupdate.com:9999" /f
reg add %REG_WINUPDATE% /v "WUStatusServer" /t REG_SZ /d "http://naoquerousarwindowsupdate.com:9999" /f
reg add %REG_WINUPDATE% /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f

rem Detectando a versão do Windows
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j

if "%VERSION%" == "10.0" (
    echo Windows 10 detectado! Instalando bloqueios adicionais...
    reg add %REG_WINUPDATE% /v "ProductVersion" /t REG_SZ /d "Windows 10" /f
    reg add %REG_WINUPDATE% /v "TargetReleaseVersion" /t REG_DWORD /d 1 /f
    reg add %REG_WINUPDATE% /v "TargetReleaseVersionInfo" /t REG_SZ /d "22H2" /f
)

echo Proibindo que o usuário reative o Windows Update...
for %%V in (UseWUServer NoAutoUpdate AUOptions NoAutoRebootWithLoggedOnUsers) do (
    reg add "%REG_WINUPDATE%\AU" /v "%%V" /t REG_DWORD /d 1 /f
)

echo Alterando permissoes do registro...
echo Criando arquivo temporário para alterar permissoes...
(
    echo HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU [2 8 19]
    echo HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate [2 8 19]
) > "%temp%\Anti-Update%build%.tmp"

echo Aplicando permissoes...
regini "%temp%\Anti-Update%build%.tmp"
echo permissoes aplicadas.
del "%temp%\Anti-Update%build%.tmp"

rem Pausando atualizações até 2077
for %%S in (
    ActiveHoursEnd 00000014
    ActiveHoursStart 00000009
    InsiderProgramEnabled 00000000
    PendingRebootStartTime "2019-07-28T03:07:38Z"
    PauseFeatureUpdatesStartTime "2019-07-28T10:38:56Z"
    PauseFeatureUpdatesEndTime "2077-01-01T10:38:56Z"
    PauseQualityUpdatesStartTime "2019-07-28T10:38:56Z"
    PauseQualityUpdatesEndTime "2077-01-01T10:38:56Z"
    PauseUpdatesStartTime "2022-06-28T19:26:20Z"
    PauseUpdatesExpiryTime "2077-01-01T10:38:56Z"
    FlightSettingsMaxPauseDays 1869
) do (
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "%%~S" /t REG_DWORD /d %%~T /f
)

If %vFlag_completo%==1 goto antiupdateservicos
pause
goto menuprincipal


:antiupdateservicos
echo parando servicos responsaveis pelos updates do windows
echo parando servico responsavel pela indexacao de pastas
echo outros servicos "nao microsoft" nao serao finalizados
echo.

for %%a in (
wuauserv
BITS 
wscsvc
SharedAccess
WSearch
) do (
echo parando o servico %%a
sc stop %%a
echo.
)

sc config wuauserv start= disabled
sc config WSearch start= disabled
sc config BITS start= demand

If %vFlag_completo%==1 goto antiupdategwx
pause
goto menuprincipal

:antiupdateuninstall
echo Liberando acesso ao arquivo HOSTS...
attrib -r -a -s -h %hostsfile%


echo Resetando o HOSTS...
(
echo 127.0.0.1 localhost
echo ::1       localhost
echo.
echo.
) > %hostsfile%

echo.
echo Alterando permissoes do registro...
echo Criando arquivo temporário necessario para alterar permissoes...

set REG_WINUPDATE="HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
set REG_SERVICES="HKLM\SYSTEM\CurrentControlSet\Services"

(
    echo HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU [1 7 17]
    echo HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate [1 7 17]
) > %temp%\Anti-Update%build%.tmp

echo Aplicando permissoes...
regini %temp%\Anti-Update%build%.tmp
echo permissoes aplicadas.
del %temp%\Anti-Update%build%.tmp
echo.

echo Revertendo mudanças do registro para permitir updates...
echo Modificando entradas do registro...

rem Definindo bloqueio de serviços via registro
for %%S in (SharedAccess wuauserv wscsvc) do (
    reg add "%REG_SERVICES%\%%S" /v "Start" /t REG_DWORD /d 4 /f
)

echo Removendo entradas instaladas anteriormente para proibir atualizações...
for %%V in (WUServer WUStatusServer) do (
    reg delete %REG_WINUPDATE% /v "%%V" /f
)

echo Proibindo que o usuário reative o Windows Update...
for %%A in (UseWUServer NoAutoUpdate AUOptions) do (
    reg add "%REG_WINUPDATE%\AU" /v "%%A" /t REG_DWORD /d 0 /f
)

for %%V in (ProductVersion TargetReleaseVersion TargetReleaseVersionInfo) do (
    reg delete %REG_WINUPDATE% /v "%%V" /f
)

echo Marcando serviços como inicializáveis...
for %%S in (wuauserv BITS) do (
    sc config %%S start= auto
)

echo Iniciando serviços...
for %%A in (wuauserv BITS wscsvc SharedAccess) do (
    sc start %%A
)

goto menuprincipal

:antiupdategwx
echo Baseado no script que desativa GWX - por CronAsatruar do forum BatchSatti
echo.

if not exist %systemroot%\system32\gwx\gwx.exe echo *** AVISO ***     *** GWX NAO INSTALADO ***
if not exist %programfiles%\RUXIM\DTUDriver.exe echo *** AVISO ***     *** RUXIM NAO INSTALADO ***

for %%x in (GWX.exe DTUDriver.exe PlugScheduler.exe) do taskkill /f /im %%x >nul 2>&1

:: Desinstalando hotfix do sistema
echo Desinstalando hotfix do sistema...
for %%a in (
    3035583 2919442 2919355 2952664 2976978 2977759 2990214
    3014460 3021917 3022345 3035583 3044374 3050265 3050267
    3065987 3068708 3075249 3075851 3080149 2999226 3083324
    3083325 3083710 3083711 5001716
) do start "" wusa /uninstall /kb:%%a /quiet /norestart

pause
echo.

echo Finalizando processos e tarefas agendadas...
for %%x in (
    launchtrayprocess refreshgwxconfig refreshgwxcontent runappraiser
    refreshgwxconfigandcontent Logon OutOfIdle refreshgwxconfig-B
    Logon-5d MachineUnlock-5d OutOfIdle-5d
) do (
    echo Finalizando GWX %%x...
    taskkill /f /IM gwx.exe
    taskkill /f /IM gwxux.exe
    taskkill /f /IM gwxuxworker.exe
    schtasks /end /tn "microsoft\windows\setup\gwx\%%x"
    schtasks /end /tn "microsoft\windows\setup\GWXTriggers\%%x"
    schtasks /change /tn "microsoft\windows\setup\gwx\%%x" /DISABLE
    schtasks /change /tn "microsoft\windows\setup\GWXTriggers\%%x" /DISABLE
    echo.
)

echo Finalizando Ruxim...
schtasks /end /tn "microsoft\Windows\WindowsUpdate\RUXIM\PlugScheduler"
schtasks /change /tn "microsoft\Windows\WindowsUpdate\RUXIM\PlugScheduler" /DISABLE

echo Iniciando proteção contra RUXIM...
if not exist "%programfiles%\RUXIM" md "%programfiles%\RUXIM"

echo.
echo CRIANDO arquivos que TEORICAMENTE impediriam o RUXIM de ser instalados em seu PC
echo Caso seja solicitado, responda SIM.

set "RUXIM_DIR=%ProgramFiles%\RUXIM"
set "RUXIM_DIR=%ProgramFiles%\RUXIM"
if not exist "%RUXIM_DIR%" md "%RUXIM_DIR%"

for %%x in (
    DTUDRIVER.exe PlugScheduler.exe PlugScheduler.xml
    RuximICS.exe RuximIH.exe RuximPHDialogHandlers.dll
    SystemEvaluator.dll antiRUXIM_by-llbranco.txt
) do (
    set "ARQUIVO=%RUXIM_DIR%\%%x"
    
    echo Criando %%x em %RUXIM_DIR%...
    fsutil file createnew "!ARQUIVO!" 1 >nul 2>&1

    echo Removendo permissoes de todos...
    cacls "!ARQUIVO!" /C /E /D SYSTEM >nul 2>&1
    cacls "!ARQUIVO!" /C /E /D Everyone >nul 2>&1
    cacls "!ARQUIVO!" /C /E /D "%USERNAME%" >nul 2>&1
)




echo.
echo Processo terminado. Agora será solicitado que você pressione qualquer tecla 3 vezes.
pause
pause
pause
goto menuprincipal


:antiupdatesobre
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo           Foi testado e funciona perfeitamente do Windows XP ao 12
echo      Foi testado e funciona perfeitamente do Windows 2000 ao 2022 server
echo.
echo                    Projeto de Luciano Branco iniciado em 2013
echo.
echo           O Anti-Update bloqueia atualizacao de: Windows, Corel e Adobe
echo           https://github.com/llbranco/scripts
echo.&echo.&echo.
pause
echo O trabalho Anti-Update do mal de Luciano Branco
echo esta licenciado com uma Licença Creative Commons
echo Atribuição-NaoComercial-CompartilhaIgual 4.0 Internacional.
echo Baseado no trabalho disponivel em https://github.com/llbranco/scripts
echo Podem estar disponíveis autorizacoes adicionais
echo as concedidas no ambito desta licenca em https://github.com/llbranco/scripts
echo.&echo.&echo.
pause
goto menuprincipal

:antiupdateverhosts
start notepad %hostsfile%
goto menuprincipal

:fim
endlocal
goto :eof
