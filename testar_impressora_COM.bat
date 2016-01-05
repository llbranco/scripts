@echo off
title Teste de impressora fistal/nao fiscal
setlocal
echo teste de impressora Fiscal/Nao fiscal
::defininado velocidade da porta

set porta=
set conexao=

::SERIAL Padrao 9600 (descobre-se vendo BOUND SPEED NO AUTOTESTE DE IMPRESSORA
set serial=9600
::USB SEMPRE VAI SER 115200
set usb=115200

echo digite o numero da porta COM que a impressora esta conectada
set /p porta=COM[1-9]: 


echo U para USB
echo S para SERIAL
set /p conexao=Selecione a porta que a impressora esta conectada[U/S]: 
if not defined conexao exit
if not defined porta exit
if /i %conexao%==u goto avanca

echo impressoras serial podem operar em velocidades diferentes
echo normalmente elas usam 9600bps porem podem operar em outros valores
echo digite a velocidade da impressora.
echo.
echo obs: no autoteste das impressoras procure pelo valor de BOUND
echo.
echo [300,600,1200,2400,4800,9600,14400,19200,38400,57600,115200]
set /p velocidade=[300-115200]: 
goto teste

:avanca
set velocidade=115200

:teste
mode COM%porta%:%velocidade%,n,8,1
set prn=COM%porta%

echo.>%prn%
echo.>%prn%
echo.>%prn%
echo TESTE DE IMPRESSORA - INFOBR INFORMATICA>%prn%
echo.>%prn%
echo imprimindo 40 caracteres:>%prn%
echo 0123456789012345678901234567890123456789>%prn%
echo.>%prn%
echo imprimindo 80 caracteres:>%prn%
echo 01234567890123456789012345678901234567890123456789012345678901234567890123456789>%prn%
echo.>%prn%
echo abcdefghijklmnopqrstuvwxyz>%prn%
echo ABCDEFGHIJKLMNOPQRSTUVWXYZ>%prn%
echo.>%prn%
echo imprimindo dir %systemdrive%>%prn%
cd \
echo.>%prn%
dir %systemdrive%>%prn%
echo.>%prn%
echo FIM DO TESTE BASICO DE IMPRESSORAS>%prn%
echo -=-=- INFOBR INFORMATICA -=-=->%prn%
echo.>%prn%
echo.>%prn%
echo.>%prn%
echo.>%prn%
echo.>%prn%
echo.>%prn%
echo nesse momento o teste ja deve ter sido impressora
echo caso n tenha sido impresso verifique a velocidade da porta
echo verifique se tudo esta devidamente plugado
echo verifique se o driver esta devidamente instalado
echo.
echo pressione qualquer tecla para fechar
pause>nul
endlocal
