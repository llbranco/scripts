@echo off
:: Definindo variaveis do ambiente
setlocal
color 71
set build=1.0
set date=03/mar/16
set versao=FileMaker ver: %build% - %date%
:: Variaveis definidas
rename %0 "filemaker_v%build%.bat"

title  %versao% -- InfoBR 2016 -- By: llbranco

:: definindo variaveis
::resetando loop
set loop1=0
set size=1024

cls
echo -------------------------------------------------------------------------------
echo                              %versao% %instalado%
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2016
echo     FileMaker cria arquivos para, propositalmente, ocupar espaço em disco
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo -------------------------------------------------------------------------------
echo                 Escolha o tamanho dos arquivos que deseja criar
echo -------------------------------------------------------------------------------
echo 1) 1KB   1024 Bytes
echo 2) 1MB   1048576 Bytes
echo 3) 10MB  10485760 Bytes
echo 4) 100MB 104857600 Bytes
echo 5) 1GB   1073741824 Bytes
echo 6) digite seu valor em Bytes
echo -------------------------------------------------------------------------------
	Set /P tamanho=	Tecle a opcao desejada e [ENTER]: 
	Cls
	If %tamanho% equ 1 set size=1024
	If %tamanho% equ 2 set size=1048576
	If %tamanho% equ 3 set size=10485760
	If %tamanho% equ 4 set size=104857600
	If %tamanho% equ 5 set size=1073741824
	If %tamanho% equ 6 set /p size= Digite o Tamanho dos arquivos que deseja criar (em Bytes):  

cls
echo.
echo vc escolheu criar arquivos de %size% Bytes
echo Agora precisamos saber QUANTOS arquivos deseja criar
	Set /P loop2= Digite o numero de arquivos que deseja criar seguido de [ENTER]: 
mkdir dummy
cd dummy
:loop
    set /a loop1=%loop1%+1

echo criando arquivo %loop1% de %loop2%
fsutil file createnew %random%%loop1%%loop2% %size%

if %loop1% EQU %loop2% (
    goto :end
) else (
    goto :loop
)

:end
    pause