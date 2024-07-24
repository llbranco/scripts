@echo off
:: definindo variavais do ambiente
:: não edite essa parte
color f0
title Ativar TRIM -- by:llbranco
::for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 850>nul
set col=;;;;  ;
SETLOCAL EnableDelayedExpansion
cd /d "%~dp0"
cls

set build=1.1
set date=24/jul/2024
set ano=2024
set versao=Ativar Trim para SSD: %build% - %date%
set linha================================================================================
rename %0 "Ativar_Trim_v%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:: elevando batch para adm
:: nao edite essa parte
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cls

:menu
cls
echo.
echo =====================================MENU======================================
echo       %versao%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2024
echo                  Ativar o TRIM para melhorar desempenho em SSD
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo %linha%
echo                     ATENCAO: DESABILITADO significa HABILITADO
echo                            ZERO Significa Habilitado
echo Estado atual do Trim:
fsutil behavior query DisableDeleteNotify
echo.
echo                               Selecione uma Opcao
echo %linha%
echo.
echo		 1  - HABILITAR TRIM
echo		 2  - DESABILITAR TRIM
echo		 3  - WINDOWS SEARCH
echo		 4  - Desabilitar servico do windows search
echo		 9  - Sobre
echo.
echo %linha%
echo                                               	por: llbranco
echo                                               	github.com/llbranco
echo                                               	thelucianobranco@gmail.com
echo.
	Set /P menu=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para %ips1%: 
	Cls
 If %menu% equ 0 goto fim
 goto op%menu%
exit

:op1
echo A Microsoft em toda sua incapacidade de contar
echo decidiu fazer com que ZERO significasse ativo
echo.
echo com um erro grotesco de semantica
echo no windows 10 o comando retorna DESABILITADO se o TRIM estiver HABILITADO
echo e vice-versa
fsutil behavior set DisableDeleteNotify 0
pause
goto menu

:op2
echo A Microsoft em toda sua incapacidade de contar
echo decidiu fazer com que ZERO significasse ativo
echo.
echo com um erro grotesco de semantica
echo no windows 10 o comando retorna DESABILITADO se o TRIM estiver HABILITADO
echo e vice-versa
fsutil behavior set DisableDeleteNotify 1
pause
goto menu

:op3
echo Abrindo janela do servico de indexacao do Windows
echo.
::start "" rundll32.exe shell32.dll,Control_RunDLL srchadmin.dll
start "" control.exe srchadmin.dll
pause
goto menu

:op4
echo Desabilitando servico de indexacao do Windows
echo permitindo um aumento de desempenho
echo e maior vida util a SSDs
echo.
sc stop "wsearch" && sc config "wsearch" start=disabled
pause
goto menu

:op5
echo Habilitando servico de indexacao do Windows
echo esse procedimento diminui o desempenho do sistema
echo e diminui a vida util do seu SSD
echo.
echo a fim de MINIMIZAR OS ESTRAGOS q esse servico faz
echo vou marcar ele como "iniciar com atraso"
sc config "wsearch" start=delayed-auto && sc start "wsearch"
pause
goto menu

:op9
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo.
echo                    Projeto de Luciano Branco iniciado em 2024
echo.
echo                  Ativar o TRIM para melhorar desempenho em SSD
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo.&echo.&echo.
pause
echo este script está licenciado com uma Licença Creative Commons
echo Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional.
echo Baseado no trabalho disponível em http://github.com/llbranco
echo Podem estar disponíveis autorizações adicionais
echo às concedidas no âmbito desta licença em http://github.com/llbranco
echo.&echo.&echo.
pause
goto menu
