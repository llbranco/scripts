@echo off
:: Definindo variaveis do ambiente
setlocal
color 71
set build=1.0
set date=18/mar/24
set ano=2024
set versao=ativador Winrar: %build% - %date%

rename %0 "ativador_winrar%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:menu
cls
echo -------------------------------------------------------------------------------
echo                          EXECUTE COMO ADMINISTRADOR
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2024
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo -------------------------------------------------------------------------------
echo                               Selecione uma Opcao
echo -------------------------------------------------------------------------------
echo 1  - Ativar Winrar (testado na versao 6.24 (2024))
echo 9  - Sobre
echo -------------------------------------------------------------------------------

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 0 goto fim
 If %opcao% equ 1 goto ativar
 if %opcao% equ 9 goto sobre
goto fim

:ativar
echo gerando arquivo de ativacao
(
echo RAR registration data
echo Hardik
echo www.Hardik.live
echo UID=448c4a899c6cdc1039c5
echo 641221225039c585fc5ef8da12ccf689780883109587752a828ff0
echo 59ae0579fe68942c97d160f361d16f96c8fe03f1f89c66abc25a37
echo 7777a27ec82f103b3d8e05dcefeaa45c71675ca822242858a1c897
echo c57d0b0a3fe7ac36c517b1d2be385dcc726039e5f536439a806c35
echo 1e180e47e6bf51febac6eaae111343d85015dbd59ba45c71675ca8
echo 2224285927550547c74c826eade52bbdb578741acc1565af60e326
echo 6b5e5eaa169647277b533e8c4ac01535547d1dee14411061928023
)> "%systemdrive%\Program Files\WinRAR\rarreg.key"
start "" "%systemdrive%\Program Files\WinRAR\winrar.exe"
pause
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