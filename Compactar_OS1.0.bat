@echo off
color 71
::definindo variaveis
	setlocal
set build=1.0
set date=18/mar/24
set ano=2024
set versao=Compactar OS ver: %build% - %date%
rename %0 "Compactar_OS%build%.bat"

:menu
title  %versao% -- %ano% -- By: llbranco
cls
set opcao=0
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2024
echo                     Compacta Windows 10+ e pastas do sistema
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo -------------------------------------------------------------------------------
echo                               Selecione uma Opcao
echo -------------------------------------------------------------------------------
echo 1  - Compactar apenas a pasta windows
echo 2  - Compactar apenas pastas adjacentes
echo 3  - compactar a pasta windows e pastas adjacentes
echo 9  - Sobre
echo -------------------------------------------------------------------------------

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 0 goto fim
 If %opcao% equ 1 goto win
 If %opcao% equ 2 goto pastas
 If %opcao% equ 3 goto win
 If %opcao% equ 9 goto sobre
goto fim


:win
title  %versao% -- Compactando Windows -- By: llbranco
compact.exe /CompactOS:always
if %opcao% equ 3 goto pastas
goto menu


:pastas
title  %versao% -- Compactando pastas adjacentes -- By: llbranco
compact /c /s /a /i /f /exe:xpress16k "%systemdrive%\Program Files\*"
compact /c /s /a /i /f /exe:xpress16k "%systemdrive%\Program Files (x86)\*"
compact /c /s /a /i /exe:lzx "%systemdrive%\ProgramData\*"
compact /c /s /a /i /exe:lzx "%systemdrive%\Windows\System32\DriverStore\*"

compact /c /s /a /i /exe:lzx "%homeDrive%\MSOCache\*"
compact /c /s /a /i /exe:lzx "%windir%\assembly\*"
compact /c /s /a /i /exe:lzx "%windir%\inf\*"
compact /c /s /a /i /exe:lzx "%windir%\infused apps\*"
compact /c /s /a /i /exe:lzx "%windir%\installer\*"

compact /c /s /a /i /exe:xpress16k "%windir%\Fonts\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\InfusedApps\*" 
compact /c /s /a /i /exe:lzx "%windir%\Installer\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\Panther\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\SoftwareDistribution\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\System32\Catroot2\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\System32\LogFiles\*" 
goto menu


:sobre
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo            Foi testado e funciona perfeitamente do Windows 10 e 11
echo             como o comando "compact" foi introduzido no windows 10
echo          este script nao funcionara em versoes anteriores do sistema
echo.
echo                  Projeto de Luciano Branco iniciado em 2024
echo.
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo.&echo.&echo.
echo This work is licensed under Attribution-ShareAlike 4.0 International.
echo To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/
echo.&echo.&echo.
pause
goto menu


:fim
endlocal
goto :eof