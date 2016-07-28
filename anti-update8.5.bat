@echo off
:: Definindo variaveis do ambiente
setlocal
color 71
set build=8.5
set date=28/jul/16
set ano=2016
set versao=Anti-Update do mal ver: %build% - %date%
set obrigado=Obrigado por desinstalar o %versao%
set hostsfile="%SystemRoot%\system32\drivers\etc\hosts"
::nesta linha abaixo serao definidos todos os endereços para bloqueio separados por ESPAÇO
::ESPAÇO é separador de itens.
::no caso de comentarios use "underline" ou "hifen" no lugar de espaços
set adobe_block=125.252.224.90 125.252.224.91 hl2rcv.adobe.com t3dns.adobe.com 3dns-1.adobe.com 3dns-2.adobe.com 3dns-3.adobe.com 3dns-4.adobe.com activate.adobe.com activate-sea.adobe.com activate-sjc0.adobe.com activate.wip.adobe.com activate.wip1.adobe.com activate.wip2.adobe.com activate.wip3.adobe.com activate.wip4.adobe.com adobe.activate.com adobe-dns.adobe.com adobe-dns-1.adobe.com adobe-dns-2.adobe.com adobe-dns-3.adobe.com adobe-dns-4.adobe.com adobeereg.com armdl.adobe.com ood.opsource.net practivate.adobe practivate.adobe.com tpractivate.adobe.newoa  practivate.adobe.ntp practivate.adobe.ipp ereg.adobe.com ereg.wip.adobe.com ereg.wip1.adobe.com ereg.wip2.adobe.com ereg.wip3.adobe.com ereg.wip4.adobe.com wip.adobe.com wip1.adobe.com wip2.adobe.com wip3.adobe.com wip4.adobe.com www.adobeereg.com www.wip.adobe.com www.wip1.adobe.com www.wip2.adobe.com www.wip3.adobe.com www.wip4.adobe.com
set autocad_block=autodesk.fi autodesk.de autodesk.es autodesk.ca autodesk.dk autodesk.pl ns1.autodesk.com ns2.autodesk.com ns3.autodesk.com a.gtld-servers.net b.gtld-servers.net c.gtld-servers.net d.gtld-servers.net e.gtld-servers.net f.gtld-servers.net g.gtld-servers.net h.gtld-servers.net i.gtld-servers.net j.gtld-servers.net k.gtld-servers.net l.gtld-servers.net ns1.autodesk.com m.gtld-servers.net adobeereg.com 126114-app1.autodesk.com 94175-app1.autodesk.com 94184-app2.autodesk.com 96579-lbal1.autodesk.com acamp.autodesk.com adeskdi3.autodesk.com adeskdmzpdc.autodesk.com adeskgate.autodesk.com adesknews2.autodesk.com adeskout.autodesk.com adsknateur.autodesk.com amernetlog.autodesk.com app5.autodesk.com aprimo-relay1.autodesk.com aprimo-relay2.autodesk.com aprimo-relay3.autodesk.com aprimo-relay4.autodesk.com autosketch.autodesk.com blues.autodesk.com cbuanprd.autodesk.com cbuanprhcllb.autodesk.com cbuanqa2lb.autodesk.com ci3dwsdev-svc.autodesk.com ci3dwsprd-svc.autodesk.com ci3dwsstg-svc.autodesk.com community.autodesk.com cut.autodesk.com cvsprd01.autodesk.com discussion.autodesk.com eur.autodesk.com extcidev.autodesk.com extciqa.autodesk.com extupg.autodesk.com ftp-users.autodesk.com ftp2b.autodesk.com gisdmzpdc.autodesk.com hqaribasrf04.autodesk.com hqmgwww01.autodesk.com hqmgwww04.autodesk.com hqmobileweb01.autodesk.com hqprxsrftrn.autodesk.com hqpsweb01.autodesk.com hubdev-svc.autodesk.com hubprd-svc.autodesk.com hubstg-svc.autodesk.com itappprd01-svc.autodesk.com itappprd02-svc.autodesk.com its.autodesk.com jdevextv-new.autodesk.com jp.autodesk.com jstgextv-new.autodesk.com jstgintv-new.autodesk.com lbsvzw.autodesk.com lbsvzw1.autodesk.com lbsvzw2.autodesk.com library.autodesk.com liveupdate.autodesk.com locationservices.autodesk.com lsctsol04.autodesk.com mail-relay.autodesk.com mneprdext-svc.autodesk.com mut.autodesk.com nbugma-dmz.autodesk.com ns1.autodesk.com ns2.autodesk.com ns3.autodesk.com ns4.autodesk.com ns5.autodesk.com nut.autodesk.com otw-new.autodesk.com otwdownloads.autodesk.com partnercenter.autodesk.com partnerproducts.autodesk.com paste.autodesk.com pedidrq.autodesk.com pediqrx.autodesk.com petars1.autodesk.com petcp11ia-2nat.autodesk.com petcr12ihsrp2.autodesk.com phxgciv.autodesk.com phxgciv_dr.autodesk.com planix3d.autodesk.com pointa.autodesk.com register.autodesk.com registerallied-pr.autodesk.com registeronce.autodesk.com salestraining.autodesk.com searchnews.autodesk.com shop.autodesk.com spamster-bulk.autodesk.com sswwwp.autodesk.com trialdownload.autodesk.com usa.autodesk.com uspetcr12ie_198.autodesk.com uspetcr12if.autodesk.com uspetcr12if_198.autodesk.com uspetcrs12ia_ib_vlan500_2_hsrp.autodesk.com uspetcrs12ia_vlan500_2.autodesk.com uspetcrs12ib_vlan500_2.autodesk.com uspetne06ia_ib_untrust_dip7.autodesk.com usrelay.autodesk.com ussclout1.autodesk.com vzwlpsrel.autodesk.com vzwlpstst.autodesk.com web.autodesk.com webservices.autodesk.com wormhole.autodesk.com www.autodesk.com www3.autodesk.com
set corel_block=corel.com apps.corel.com mc.corel.com
set windows_block=mpa.one.microsoft.com  sls.microsoft.com  genuine.microsoft.com wat.microsoft.com mpa.microsoft.com searchclient.live.net office.microsoft.com watson.microsoft.com content.microsoft.com logging.microsoft.com windowsupdate.com download.windowsupdate.com download.microsoft.com ntservicepack.microsoft.com update.microsoft.com www.windowsupdate.com windowsupdate.microsoft.com www.windowsupdate.microsoft.com www.wustat.windows.com
:: Variaveis definidas
rename %0 "anti-update%build%.bat"

title  %versao% -- InfoBR %ano% -- By: llbranco

:menuprincipal
set opcao=0
set vFlag_hosts=0
set vFlag_registro=0
set vFlag_completo=0
set GWX=GWX nao instalado
FIND /C /I "#%versao%" %hostsfile%
IF %ERRORLEVEL% NEQ 1 set instalado=esta instalado e atualizado.
IF %ERRORLEVEL% NEQ 0 set instalado=nao instalado ou esta desatualizado.

if exist "%systemroot%\system32\gwx\gwx.exe" set GWX=GWX instalado
if exist "%systemroot%\system32\gwx\antigwx_by-llbranco.txt" set GWX=PROTEGIDO CONTRA GWX
if "%gwx%"=="GWX instalado" (
color 4f
) 
cls
echo -------------------------------------------------------------------------------
echo    O %versao% %instalado%
echo                          %GWX%
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2013
echo           O Anti-Update bloqueia atualizacao de: Windows, Corel e Adobe
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo -------------------------------------------------------------------------------
echo                               Selecione uma Opcao
echo -------------------------------------------------------------------------------
echo 1  - Instalar ou Atualizar o Bloqueio (Versao Completa) remove GWX
echo 2  - Instalar ou Atualizar o Bloqueio (Apenas HOSTS)
echo 3  - Instalar ou Atualizar o Bloqueio (Apenas Registro)
echo 4  - Instalar ou Atualizar o Bloqueio (Apenas servicos)
echo 5  - Desistalar e Reverter ao original (Updates voltam a funcionar)
echo 6  - Sobre
echo 7  - Abrir HOSTS no Bloco de Notas
echo 8  - Remover GWX apenas (pode voltar se update estiver ativo)
echo -------------------------------------------------------------------------------

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
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
if exist %systemroot%\system32\gwx\gwx.exe (
call %antiupdategwx%
) else (
echo %systemroot%\system32\gwx\gwx.exe nao encontrado
echo update kb3035583 APARENTEMENTE nao instalado
)
goto antiupdate_avancar

:antiupdatehosts
set vFlag_hosts=1
goto antiupdate_avancar

:antiupdateregistro
set vFlag_registro=1
goto antiupdate_avancar

:antiupdate_avancar
If %vFlag_hosts%==1 goto antiupdatehosts
If %vFlag_registro%==1 goto antiupdateregistro
If %vFlag_completo%==1 goto antiupdatehosts


:antiupdatehosts
:: ----------------------------------------- Liberanco permissões do arquivo -----------------------------------------
echo liberando acesso ao arquivo HOSTS
attrib -r -a -s -h %hostsfile%


:: ------------------------------------------------ Cabeçalho do HOSTS -----------------------------------------------
echo resetando o hosts
(
echo #%versao%
echo 127.0.0.1 localhost
echo ::1       localhost
echo.
echo.
)>%hostsfile%

:: --------------------------------------------------- Adobe Block ---------------------------------------------------
echo instalando o %versao% para Adobe Block
(
echo #%versao% -- inicio
echo.
echo.
echo #Adobe block - linhas abaixo
)>>%hostsfile%

for %%s in (%adobe_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)
for /l %%n in (30,1,125) do find /c /i "wwis-dubc1-vip%%n.adobe.com" %hostsfile%>nul||(echo.Adicionando "wwis-dubc1-vip%%n.adobe.com" ao arquivos hosts&echo.127.0.0.1 wwis-dubc1-vip%%n.adobe.com>>%hostsfile%||echo.Acesso negado gravando %%n!)

:: --------------------------------------------------- Corel Block ---------------------------------------------------
echo instalando o %versao% para Corel Block
(
echo.
echo.
echo #Corel block - linhas abaixo
)>>%hostsfile%

for %%s in (%corel_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)


:: -------------------------------------------------- AutoCad Block -------------------------------------------------
echo instalando o %versao% para AutoCad Block
(
echo.
echo.
echo #AutoCad block - linhas abaixo
)>>%hostsfile%

for %%s in (%autocad_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)


:: -------------------------------------------------- Windows Block --------------------------------------------------
echo instalando o %versao% para Windows Block
(
echo.
echo.
echo #Windows block - linhas abaixo
)>>%hostsfile%


for %%s in (%windows_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)
:: --------------------------------------------------- finalizando ---------------------------------------------------

(
echo.
echo.
echo #%versao% -- fim
)>>%hostsfile%

If %vFlag_hosts%==1 goto menuprincipal
If %vFlag_completo%==1 goto antiupdateregistro


:antiupdateregistro
echo modificando entradas do registro
echo.
echo definindo bloqueio de servicos via registro
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d 4 /f
echo.
echo definindo entradas propositalemten invalidas
echo afim de proibir que o windows atualize
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer" /t REG_SZ /d "http://naoquerousarwindowsupdate.com:9999" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /t REG_SZ /d "http://naoquerousarwindowsupdate.com:9999" /f
echo.
echo proibindo que o usuario re-ative o Windows-Update
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 1 /f
echo.
echo alterando permissoes do registro
echo ... ... ... ... ... ... ... ... ... ... ... ... ...
echo criando arquivo temporario necessario para alterar permissoes do registros
(
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU [2 8 19]
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate [2 8 19]
)> %temp%\Anti-Update%build%.tmp
echo ... ... ... ... ... ... ... ... ... ... ... ... ...
type %temp%\Anti-Update%build%.tmp
echo aplicando permissoes
regini %temp%\Anti-Update%build%.tmp
echo permissoes aplicadas
echo.
echo deletando arquivo temporario
del %temp%\Anti-Update%build%.tmp

If %vFlag_completo%==1 goto antiupdateservicos
pause
goto menuprincipal


:antiupdateservicos
echo parando servicos responsaveis pelos updates do windows
echo outros servicos "nao microsoft" nao serao finalizados

sc config wuauserv start= disabled
sc config BITS start= demand

sc stop wuauserv
sc stop BITS 
sc stop wscsvc
sc stop SharedAccess

If %vFlag_completo%==1 goto antiupdategwx
pause
goto menuprincipal


:antiupdateuninstall
echo liberando acesso ao arquivo HOSTS
attrib -r -a -s -h %hostsfile%

echo resetando o hosts
(
echo 127.0.0.1 localhost
echo ::1       localhost
echo.
echo.
)>%hostsfile%

echo.
echo alterando permissoes do registro
echo ... ... ... ... ... ... ... ... ... ... ... ... ...
echo criando arquivo temporario necessario para alterar permissoes do registros
(
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU [1 7 17]
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate [1 7 17]
)> %temp%\Anti-Update%build%.tmp
echo ... ... ... ... ... ... ... ... ... ... ... ... ...
type %temp%\Anti-Update%build%.tmp
echo aplicando permissoes
regini %temp%\Anti-Update%build%.tmp
echo permissoes aplicadas
echo.
echo deletando arquivo temporario
del %temp%\Anti-Update%build%.tmp
echo.
echo revertendo mudancas do registro
echo afim de permitir update
echo modificando entradas do registro
echo.
echo definindo bloqueio de servicos via registro
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d 4 /f
echo.
echo removendo entradas instaladas anteriormente
echo afim de proibir que o windows atualize
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer" /t REG_SZ /d "http://naoquerousarwindowsupdate.com:9999" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /t REG_SZ /d "http://naoquerousarwindowsupdate.com:9999" /f
echo.
echo proibindo que o usuario re-ative o Windows-Update
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 4 /f


echo marcando servicos como inicializaveis
sc config wuauserv start= auto
sc config BITS start= auto

echo iniciando servicos
sc start wuauserv
sc start BITS
sc start wscsvc
sc start SharedAccess

goto menuprincipal

:antiupdategwx
echo Desabilitando GWX - agradecimentos a CronAsatruar forum BatchSatti
echo.
if not exist %systemroot%\system32\gwx\gwx.exe echo *** AVISO ***     *** GWX NAO INSTALADO ***
taskkill /f /im  GWX.exe
echo desinstalando hotfix do sistema
for %%a in (
3035583
2919442
2919355
2952664
2976978
2977759
2990214
3014460
3021917
3022345
3035583
3044374
3050265
3050267
3065987
3068708
3075249
3075851
3080149
2999226
3083324
3083325
3083710
3083711
) do start "" wusa /uninstall /kb:%%a /quiet /norestart
ECHO.
echo finalizando processos e finalizando tarefas agendadas
for %%x in (
launchtrayprocess
refreshgwxconfig
refreshgwxcontent
runappraiser
refreshgwxconfigandcontent
Logon
OutOfIdle
refreshgwxconfig-B
Logon-5d
MachineUnlock-5d
OutOfIdle-5d
OutOfSleep-5d
Time-5d
) do (
taskkill /f /IM gwx.exe
taskkill /f /IM gwxux.exe
taskkill /f /IM gwxuxworker.exe
schtasks /end /tn "microsoft\windows\setup\gwx\%%x"
schtasks /end /tn "microsoft\windows\setup\GWXTriggers\%%x"
schtasks /change /tn "microsoft\windows\setup\gwx\%%x" /DISABLE
schtasks /change /tn "microsoft\windows\setup\GWXTriggers\%%x" /DISABLE
)
::taskschd.msc

::criar proteção anti GWX
echo iniciar protecao contra GWX
if not exist "%systemroot%\system32\gwx" md "%systemroot%\system32\gwx"
if not exist "%systemroot%\system32\gwx\download" md "%systemroot%\system32\gwx\download"

ECHO.
echo CRIANDO arquivos que teoricamente impediriam o GWX de ser instalados em seu PC
echo caso seja solicitado responda SIM

for %%x in (
config.cat
config.xml
detector.dat
gstatus.ini
gstatus32.sdb
gstatus64.sdb
gwx.exe
gwxconfigmanager.exe
gwxui.dll
gwxux.exe
gwxxworker.exe
telemetrystore.xml
telemetrystore.xml.lock
antigwx_by-llbranco.txt
) do (
fsutil file createnew "%systemroot%\system32\gwx\%%x" 1
CACLS "%systemroot%\system32\gwx\%%x" /c /G "%UserName%":R
CACLS "%systemroot%\system32\gwx\%%x" /c /E /R "%UserName%"
CACLS "%systemroot%\system32\gwx\%%x" /c /P "%UserName%":N
CACLS "%systemroot%\system32\gwx\%%x" /c /D "%UserName%"
CACLS "%systemroot%\system32\gwx\%%x" /c /D "System"
CACLS "%systemroot%\system32\gwx\%%x" /c /D "everyone"
CACLS "%systemroot%\system32\gwx\%%x" /c /D "todos"
)
echo.
echo processo terminado.
echo agora sera solicitado que vc pressione qualquer tecla 3 vezes
echo depois vc retornara ao menu principal
pause
pause
pause
goto menuprincipal

:antiupdatesobre
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo           Foi testado e funciona perfeitamente do Windows XP ao 8.1
echo      Foi testado e funciona perfeitamente do Windows 2000 ao 2012 server
echo.
echo                    Projeto de Luciano Branco iniciado em 2013
echo.
echo           O Anti-Update bloqueia atualizacao de: Windows, Corel e Adobe
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo.&echo.&echo.
pause
echo O trabalho Anti-Update do mal de Luciano Branco
echo está licenciado com uma Licença Creative Commons
echo Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional.
echo Baseado no trabalho disponível em http://trashcleaner.forumbrasil.net.
echo Podem estar disponíveis autorizações adicionais
echo às concedidas no âmbito desta licença em http://trashcleaner.forumbrasil.net.
echo.&echo.&echo.
pause
goto menuprincipal

:antiupdateverhosts
start notepad %hostsfile%
goto menuprincipal

:fim
endlocal
goto :eof
