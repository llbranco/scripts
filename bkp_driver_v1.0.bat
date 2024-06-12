@echo off
:: Definindo variaveis do ambiente
::setlocal enabledelayedexpansion
setlocal
color 71
set build=1.0
set date=15/04/24
set ano=2024
set bkp=%SystemDrive%\bkp_drivers
set versao=Backup Driver ver: %build% - %date%
set linha=-------------------------------------------------------------------------------

rename %0 "bkp_driver_v%build%.bat"

cd /d %SystemDrive%
cd \

::verificando winrar
IF EXIST "%SystemDrive%\Program Files\WinRAR\rar.exe" (
set rar="%SystemDrive%\Program Files\WinRAR\rar.exe"
set unrar="%SystemDrive%\Program Files\WinRAR\unrar.exe"
)

IF EXIST "%SystemDrive%\Program Files (x86)\WinRAR\rar.exe" (
set rar="%SystemDrive%\Program Files (x86)\WinRAR\rar.exe"
set unrar="%SystemDrive%\Program Files (x86)\WinRAR\unrar.exe"
)

::verificando a existencia de backup
IF EXIST "%bkp%\bkp_drivers.rar" (
set verificabkp=Backup Encontrado
) else (
set verificabkp=backup nao encontrado
)

mkdir %bkp%
cd %bkp%
mkdir drivers

:menu
title  %versao% -- %ano% -- By: llbranco
cls
echo %linha%
echo  - %verificabkp% -
echo %linha%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2024
echo         O bkp_driver faz e restaura backup de todos os drivers do sistema
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo %linha%
echo                               Selecione uma Opcao
echo %linha%
echo 1  - Efetuar backup dos drivers
echo 2  - Restaurar backup ( %verificabkp% )
echo 9  - Sobre
echo %linha%

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 1 goto backup
 If %opcao% equ 2 goto restaura
 if %opcao% equ 9 goto sobre
goto fim

:fim
exit

:sobre
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo.
echo                    Projeto de Luciano Branco iniciado em 2024
echo.
echo        O bkp_driver faz e restaura backup de todos os drivers do sistema
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo.&echo.&echo.
pause
echo O trabalho Anti-Update do mal de Luciano Branco
echo está licenciado com uma Licença Creative Commons
echo Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional.
echo Baseado no trabalho disponível em http://github.com/llbranco
echo Podem estar disponíveis autorizações adicionais
echo às concedidas no âmbito desta licença em thelucianobranco@gmail.com
echo.&echo.&echo.
pause
goto menu


:backup
title  %versao% -- Efetuando Backup -- By: llbranco
echo fazendo backup de drivers
dism /online /export-driver /destination:"%SystemDrive%\bkp_drivers\drivers"
::pnputil /export-driver * "%SystemDrive%\bkp_drivers\drivers"
::Export-WindowsDriver -Online -Destination "%SystemDrive%\bkp_drivers\drivers"
pause
echo compactando drivers usando winrar, por favor aguarde
echo dependendo do numero de drivers e o tamanho deles essa etapa pode demorar
%rar% a -ep1 -idq -m5 -r -y "%bkp%\bkp_drivers.rar" "%bkp%\drivers"
pause


:restaura
title  %versao% -- Restaurando Backup -- By: llbranco
IF EXIST "%bkp%\bkp_drivers.rar" (
echo iniciando a restauração
echo ...
) else (
echo o backup não foi encontrado em "%bkp%\bkp_drivers.rar" 
echo estou criando a pasta aqui, favor por o backup la
mkdir %bkp%
cd %bkp%
mkdir drivers
pause
)
echo descompactando o backup 
echo usando %unrar%
%unrar% x "%bkp%\bkp_drivers.rar" * "%bkp%"
echo ...
echo restaurando o backup
pnputil /add-driver "%SystemDrive%\bkp_drivers\drivers\*.inf" /subdirs /install

::Dism /online /Add-Driver /Driver:"%SystemDrive%\bkp_drivers\drivers" /Recurse
::powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "&{Add-WindowsDriver -Driver "%SystemDrive%\bkp_drivers\drivers" -Recurse}"
pause
goto menu
