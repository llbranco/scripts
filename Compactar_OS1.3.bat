@echo off
color 71
::definindo variaveis
	setlocal
set build=1.3
set date=02/jul/24
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
echo 3  - Compactar a pasta windows e pastas adjacentes
echo 4  - Compactar outra pasta ou drive
echo 5  - Descompactar Windows
echo 6  - Descompactar pastas adjacentes do windows
echo 7  - Descompactar outra pasta ou disco
echo 9  - Sobre
echo -------------------------------------------------------------------------------

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 0 goto fim
 If %opcao% equ 1 goto win
 If %opcao% equ 2 goto pastas
 If %opcao% equ 3 goto win
 If %opcao% equ 4 goto outro
 If %opcao% equ 5 goto uncompwin
 If %opcao% equ 6 goto uncomppastas
 If %opcao% equ 6 goto uncompoutro
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
compact /c /s /a /i /exe:lzx "%windir%\winsxs"

compact /c /s /a /i /exe:xpress16k "%windir%\Fonts\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\InfusedApps\*" 
compact /c /s /a /i /exe:lzx "%windir%\Installer\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\Panther\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\SoftwareDistribution\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\System32\Catroot2\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\System32\LogFiles\*" 
goto menu

:outro
set f_outro=0
Cls
echo Qual pasta ou drive vc gostaria de compactar (sem a "\")?
echo favor nao apontar arquivos apenas drive ou pasta
echo.
 Set /P f_outro= Tecle a opcao desejada e [ENTER] ou 9 e [ENTER] para retornar: 
 Cls
 If %f_outro% equ 0 goto erro_outro
 If %f_outro% equ 9 goto menu
compact /c /s /a /i /exe:lzx "%f_outro%\*"
goto menu

:erro_outro
echo vc nao selecionou nenhuma pasta ou selecionou uma pasta invalida
echo favor escolha uma opcao valida
pause
goto menu

:uncompwin
title  %versao% -- Desompactando Windows -- By: llbranco
compact.exe /CompactOS:never
compact /u /s /a %windir%
goto menu

:uncomppastas
title  %versao% -- Descompactando pastas adjacentes -- By: llbranco
compact /u "%systemdrive%\Program Files\*"
compact /u "%systemdrive%\Program Files (x86)\*"
compact /u "%systemdrive%\ProgramData\*"
compact /u "%systemdrive%\Windows\System32\DriverStore\*"

compact /u "%homeDrive%\MSOCache\*"
compact /u "%windir%\assembly\*"
compact /u "%windir%\inf\*"
compact /u "%windir%\infused apps\*"
compact /u "%windir%\installer\*"
compact /u "%windir%\winsxs"

compact /u "%windir%\Fonts\*" 
compact /u "%windir%\InfusedApps\*" 
compact /u "%windir%\Installer\*" 
compact /u "%windir%\Panther\*" 
compact /u "%windir%\SoftwareDistribution\*" 
compact /u "%windir%\System32\Catroot2\*" 
compact /u "%windir%\System32\LogFiles\*" 
goto menu


:uncompoutro
set f_outro=0
Cls
echo Qual pasta ou drive vc gostaria de compactar (sem a "\")?
echo favor nao apontar arquivos apenas drive ou pasta
echo.
 Set /P f_outro= Tecle a opcao desejada e [ENTER] ou 9 e [ENTER] para retornar: 
 Cls
 If %f_outro% equ 0 goto erro_outro
 If %f_outro% equ 9 goto menu
compact /U "%f_outro%\*"
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
