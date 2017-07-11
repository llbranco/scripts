@echo off
@prompt
@color 17
setlocal
set uefi=D:\Serva300_uefi
set bios=D:\Serva214
set erro=.
set titulo=Selecionar Versao do Serva v1.0 - llbranco
set linha=-------------------------------------------------------------------------------
:menu
title %titulo%
set opcao=0
set serva=bios
cls
echo %linha%
echo ..%titulo%..
echo %linha%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                 Projeto de Luciano Branco iniciado em 11/07/2017
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo %linha%
echo%erro%
echo                            Qual Serva deseja iniciar?
echo.
echo %linha%
echo	 0  - BIOS
echo	 1  - UEFI
echo %linha%
echo.
	Set /P opcao=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para BIOS: 
	Cls
	If %opcao% equ 0 goto bios
	If %opcao% equ 1 goto uefi
	
:erro
set erro= um erro foi encontrado, tente novamente
goto menu

:bios
echo Finalizando serva
@taskkill /f /im "serva64.exe"
@taskkill /f /im "serva32.exe"
echo iniciando serva214
net share WIA_WDS_share /delete
net share WIA_WDS_share="%bios%\pxe\WIA_WDS" /UNLIMITED
start "" "%bios%\Serva64.exe"
goto fim

:uefi
echo Finalizando serva
@taskkill /f /im "serva64.exe"
@taskkill /f /im "serva32.exe"
echo iniciando serva300
net share WIA_WDS_share /delete
net share WIA_WDS_share="%uefi%\WIA_WDS" /UNLIMITED
start "" "%uefi%\Serva64.exe"
goto fim

:fim
endlocal
exit