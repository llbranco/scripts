@echo off
:: definindo variavais do ambiente
:: não edite essa parte
color f0
title Troca-Gateway -- by:llbranco
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul
set col=;;;;  ;
SETLOCAL EnableDelayedExpansion
cd /d "%~dp0"
cls

set gateway=
set menu=1

set build=1.1
set date=03/06/2022
set ano=2022
set versao=Troca fácil de Gateway ver: %build% - %date%
rename %0 "trocagateway_v%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:: elevando batch para adm
:: não edite essa parte
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cls

:: ****************************************************************************************************
:: ****************************************************************************************************
::                               DEFINA ABAIXO OS PARAMETROS DA SUA REDE
:: ****************************************************************************************************
:: ****************************************************************************************************

::faixa de ip da rede, é necessário que toda a rede (principalmente os 2 gateways) estejam na mesma faixa
set faixadeip=192.168.0.
set mascaradeip=255.255.255.0
:: é recomendado ter um dns externo a rede como terciario recomendo um desses:
:: 8.8.8.8 / 8.8.4.4 do google
:: 1.1.1.1 / 1.0.0.1 da Cloudflare
:: 176.103.130.130 / 176.103.130.131 adguard (bloqueador de anuncios)
set dnsterciario=8.8.8.8

::nome da primeira internet (esse roteador DEVE OBRIGATÓRIAMENTE estar com DHCP Ativo, será a internet padrão)
set ips1=Internet1
set fimdoip1=1

::nome da segunda internet (esse roteador DEVE OBRIGATÓRIAMENTE estar com DHCP Inativo/desligado)
set ips2=Internet2
set fimdoip2=2

:: definir nome e ip das maquinas
:: recomendo fazer um resumo parecido com o exemplo abaixo

:: Ip 	txt de ID		Nome Apresentável do pc
:: 107	servidor.txt	Servidor
:: 201	pc1.txt			Computador 1
:: 202	pc2.txt			Computador 2
:: 203	pc3.txt			Computador 3
:: 204	pc4.txt			Computador 4
:: 205	pc5.txt			Computador 5
:: 206	pc6.txt			Computador 6


:: txt = nome do arquivo txt necessário para identificar a máquina, exemplo ( zeluiz )
:: pc+numero = nome por estenso do computador, exemplo ( José Luiz )
:: ip+numero = final do ip fixo da maquina
:: o arquivo txt deve estar localizado em c:\net\arquivoaqui.txt

set txt1=servidor
set pc1=Servidor
set ip1=107
set txt2=pc1
set pc2=Computador 1
set ip2=201
set txt3=pc2
set pc3=Computador 2
set ip3=202
set txt4=pc3
set pc4=Computador 3
set ip4=203
set txt5=pc4
set pc5=Computador 4
set ip5=204
set txt6=pc5
set pc6=Computador 5
set ip6=205
set txt7=pc6
set pc7=Computador 6
set ip7=206
set txt8=pc7
set pc8=Computador 7
set ip8=207
set txt9=pc8
set pc9=Computador 8
set ip9=208
:: caso precisar de mais é só continuar acrescentando linhas obedecendo a ordem
set txt10=pc9
set pc10=Computador 9
set ip10=209

:: endereço de ip (apenas final) caso a detecção falhar ou o arquivo txt não for criado (evite 1 e 255)
set pc=250

if exist c:\net\%txt1%.txt set pc=%ip1%&&set nome=%pc1%
if exist c:\net\%txt2%.txt set pc=%ip2%&&set nome=%pc2%
if exist c:\net\%txt3%.txt set pc=%ip3%&&set nome=%pc3%
if exist c:\net\%txt4%.txt set pc=%ip4%&&set nome=%pc4%
if exist c:\net\%txt5%.txt set pc=%ip5%&&set nome=%pc5%
if exist c:\net\%txt6%.txt set pc=%ip6%&&set nome=%pc6%
if exist c:\net\%txt7%.txt set pc=%ip7%&&set nome=%pc7%
if exist c:\net\%txt8%.txt set pc=%ip8%&&set nome=%pc8%
if exist c:\net\%txt9%.txt set pc=%ip9%&&set nome=%pc9%
:: caso precisar de mais é só continuar acrescentando linhas obedecendo a ordem
if exist c:\net\%txt10%.txt set pc=%ip10%&&set nome=%pc10%
:: ****************************************************************************************************
cls
:: nome da interface de rede que queira aplicar a troca de gateway, exatamente como o windows mostra
set conexao=conexão local


:: OBS:
:: caso vc precisou incluir mais computadores adicionando manualmente linhas acima
:: procure proximo a :user1
:: lá será necessario adicionar manualmente tbm


:: ****************************************************************************************************
:: ****************************************************************************************************
::                               DEFINA ACIMA OS PARAMETROS DA SUA REDE
:: ****************************************************************************************************
:: ****************************************************************************************************


:menu
:: obtendo endereço de gateway
set "ip="
for /f "tokens=2,3 delims={,}" %%a in ('"WMIC NICConfig where IPEnabled="True" get DefaultIPGateway /value | find "I" "') do if not defined ip set ip=%%~a

:: descobrindo se é %ips1% ou %ips2%
set net=%ip%
set net=%net:~10%

if %net% equ 1 set internet=%ips1%
if %net% equ 2 set internet=%ips2%


cls
echo.
echo =====================================MENU======================================
echo       %versao%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2022
echo     O Troca-Gateway permite a troca interativa entre 2 internets na mesma rede
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo ===============================================================================
echo.
echo                               Selecione uma Opção
echo                               Internet atual: %internet%			
echo ===============================================================================
echo.
echo		 1  - %ips1%
echo		 2  - %ips2%
echo.
echo		 0  - Para sair sem trocar a internet
echo		 9  - Escolher usuario (Usuário Atual:%nome%  IP:%faixadeip%%pc%)
echo.
echo		 a  - Acessar www.meuip.com.br
echo		 s  - Sobre
echo.
echo ===============================================================================
echo                                               	por: llbranco
echo                                               	github.com/llbranco
echo                                               	thelucianobranco@gmail.com
echo.
	Set /P menu=	Tecle a opção desejada e [ENTER] ou apenas [ENTER] para %ips1%: 
	Cls
	If %menu% equ 1 goto NET1
	If %menu% equ 2 goto NET2
	If %menu% equ 0 goto :eof
	If %menu% equ 9 goto user1
	if %menu% equ a goto meuip
	if %menu% equ s goto sobre
goto fim

:meuip
start "" http://meuip.com.br
goto menu

:user1
set user2=a
echo Escolha o usuário
echo		 0  - ip:%ip1%	%pc1%
echo		 1  - ip:%ip2%	%pc2%
echo		 2  - ip:%ip3%	%pc3%
echo		 3  - ip:%ip4%	%pc4%
echo		 4  - ip:%ip5%	%pc5%
echo		 5  - ip:%ip6%	%pc6%
echo		 6  - ip:%ip7%	%pc7%
echo		 7  - ip:%ip8%	%pc8%
echo		 8  - ip:%ip9%	%pc9%
:: caso precisar de mais é só continuar acrescentando linhas obedecendo a ordem
echo		 9  - ip:%ip10%	%pc10%
Set /P user2= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para voltar ao menu:
	If %user2% equ a goto menu
	If %user2% equ 0 set pc=%ip1%&&set nome=%pc1%
	If %user2% equ 1 set pc=%ip2%&&set nome=%pc2%
	If %user2% equ 2 set pc=%ip3%&&set nome=%pc3%
	If %user2% equ 3 set pc=%ip4%&&set nome=%pc4%
	If %user2% equ 4 set pc=%ip5%&&set nome=%pc5%
	If %user2% equ 5 set pc=%ip6%&&set nome=%pc6%
	If %user2% equ 6 set pc=%ip7%&&set nome=%pc7%
	If %user2% equ 7 set pc=%ip8%&&set nome=%pc8%
	If %user2% equ 8 set pc=%ip9%&&set nome=%pc9%
	If %user2% equ 9 set pc=%ip10%&&set nome=%pc10%
	cls
goto menu

:NET1
echo definindo internet para %ips1%
netsh interface ip set address "%conexao%" static %faixadeip%%pc% %mascaradeip% %faixadeip%%fimdoip1%
netsh interface ipv4 set dnsservers name="%conexao%" static %faixadeip%%fimdoip1% primary
netsh interface ipv4 add dnsservers name="%conexao%" %dnsterciario% index=2

netsh interface ipv4 set winsservers name="%conexao%" static %faixadeip%%fimdoip1%
goto ok

:NET2
echo definindo internet para %ips2%

netsh interface ip set address "%conexao%" static %faixadeip%%pc% %mascaradeip% %faixadeip%%fimdoip2%
netsh interface ipv4 set dnsservers name="%conexao%" static %faixadeip%%fimdoip2% primary
netsh interface ipv4 add dnsservers name="%conexao%" %dnsterciario% index=2

netsh interface ipv4 set winsservers name="%conexao%" static %faixadeip%%fimdoip2%
goto ok

:ok
If %menu% equ 1 set menu=%ips1%
If %menu% equ 2 set menu=%ips2%
echo internet trocada com sucesso para %menu%
ping -n 5 -w 1000 0.0.0.1 > nul
echo Executando tarefas adicionais etapa [1/4], aguarde
ipconfig /flushdns
cls
echo Executando tarefas adicionais etapa [2/4], aguarde
ipconfig /renew
cls
echo Executando tarefas adicionais etapa [3/4], aguarde
ipconfig /release
cls
echo Executando tarefas adicionais etapa [4/4], aguarde
ipconfig /registerdns
cls
echo Tarefas adicionais concluídas
echo caso essa janela não tenha se fechado automaticamente
echo pode fecha-la agora
goto :eof


:sobre
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo           O Script deve funciona perfeitamente do Windows XP ao 11
echo                      e do Windows server 2012 ao 2022
echo.
echo                    Projeto de Luciano Branco (llbranco) iniciado em 2022
echo.
echo     O Troca-Gateway permite a troca interativa entre 2 internets na mesma rede
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo                                                   github.com/llbranco
echo.&echo.&echo.
pause
echo.&echo.&echo.
echo O trabalho Troca fácil de gateway (ou troca-gateway) de Luciano Branco
echo está protegido com uma Licença Creative Commons BY-NC-SA 4.0
echo (Atribuição - Não Comercial - Compartilha Igual - 4.0 Internacional)
echo Licença em https://creativecommons.org/licenses/by-nc-sa/4.0
echo.&echo.&echo.
pause
echo.&echo.&echo.
echo Sinta-se livre para editar e compartilhar
echo desde que:
echo 1) mantenha meu nome como criador, pode incluir seu nome, mas o meu deve vir antes (como CRIADOR)
echo exemplo:
echo criado por: Luciano Branco (llbranco) modificiado por Fulano de Tal (psycofulano22)
echo.
echo 2) meu nome e nick e ao menos 1 contato devem estar na tela menu/principal
echo.
echo 3) mantenha os créditos, em algum local visivel
echo.
echo 4) não é necessariamente obrigatório, mas eu ficaria feliz em poder ver
echo as modificações do projeto, então, se possivel, me envie por email
echo.&echo.&echo.
pause
goto menu


:fim
echo vc não selecionou uma internet
pause
goto menu


goto :eof
