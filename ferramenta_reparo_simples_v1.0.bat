@echo off
:: Definindo variaveis do ambiente
setlocal
color 71
set build=1.0
set date=16/jul/24
set ano=2024
set versao=Ferramenta de reparo simples do windows ver: %build% - %date%
:: set frs_log=%~dp0reparoboot.log
set frs_log=reparoboot.log

:: Variaveis definidas
rename %0 "ferramenta_reparo_simples_v%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:menuprincipal
set opcao=0
cls
echo -------------------------------------------------------------------------------
echo    O %versao% %instalado%
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2024
echo           Ferramenta para executar reparos simples no windows
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo -------------------------------------------------------------------------------
echo                               Selecione uma Opcao
echo -------------------------------------------------------------------------------
echo 1  - DISM /online /Cleanup-Image /StartComponentCleanup
echo 2  - DISM /Online /Cleanup-image /RestoreHealth
echo 3  - SFC /Scannow
echo 4  - Reparar Boot / BCD
echo 5  - Reiniciar para BIOS/UEFI
echo 6  - CHKDSK /F/V/R/X X: (SELECIONE A UNIDADE)
echo 7  - Sobre
echo 8  - Abrir janelas cmd e notepad
echo 9  - Arquivo de log (%frs_log%)
echo a  - remover unidade
echo 0  - Sair
echo -------------------------------------------------------------------------------

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 0 goto fim
 If %opcao% equ 1 goto op1
 If %opcao% equ 2 goto op2
 If %opcao% equ 3 goto op3
 If %opcao% equ 4 goto op4
 If %opcao% equ 5 goto op5
 If %opcao% equ 6 goto op6
 If %opcao% equ 7 goto op7
 If %opcao% equ 8 goto op8
 If %opcao% equ 9 goto op9
 If %opcao% equ a goto opa
 If %opcao% equ A goto opa
goto fim

:op1
@echo on
DISM /online /Cleanup-Image /StartComponentCleanup
@echo off
pause
goto menuprincipal

:op2
@echo on
DISM /Online /Cleanup-image /RestoreHealth
@echo off
pause
goto menuprincipal

:op3
:: https://www.windowscentral.com/how-use-sfc-scannow-command-fix-problems-windows-10
set unidade=0
echo Selecione a unidade que deseja executar o reparo
echo.
echo um arquivo de log sera gerado na pasta %~dp0
 Set /P unidade= Selecione a letra da unidade sem os : e [ENTER]: 
  If %unidade% equ 0 goto op3_erro
if not exist "%frs_log%" echo arquivo de log criado em %date% - %time%>%frs_log%
echo.>>%frs_log%
echo %date% - %time% >> %frs_log%
echo executando reparo de sfc /scannow na unidade %unidade%: >> %frs_log%
@echo on
for /f "delims=" %%i in (
'sfc /scannow /offbootdir=e:\ /offwindir=%unidade%:\Windows'
) do (
    echo [%date%, %time%] %%i >> %frs_log%
)
@echo off
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log >> %frs_log%
pause
goto menuprincipal

:op4
set unidade=0
echo Selecione a unidade que deseja executar o reparo
echo.
echo um arquivo de log sera gerado na pasta %~dp0
 Set /P unidade= Selecione a letra da unidade sem os : e [ENTER]: 
  If %unidade% equ 0 goto op4_erro
if not exist "%frs_log%" echo arquivo de log criado em %date% - %time%>%frs_log%
echo.>>%frs_log%
echo %date% - %time% >>%frs_log%
echo executando reparo de boot / BCD na unidade %unidade%:>>%frs_log%

@echo on
for /f "delims=" %%i in (
'Bcdedit /export %unidade%:\BCD_Backup'
'Bootrec /FixMbr'
'Bootrec /fixboot'
'Bootrec /rebuildbcd'
) do (
    echo [%date%, %time%] %%i >> %frs_log%
)
@echo off
choice /C:SN /M:"O comando acima apresentou algum erro? [SN]"
IF ERRORLEVEL ==1 GOTO op4_yes
IF ERRORLEVEL ==2 GOTO op4_no
GOTO op4_erro

pause
:op4_yes
@echo on
%unidade%:\boot\bcd bcd.old >>%frs_log%
@echo off

:op4_no
@echo on
Bcdedit /store %unidade%:\boot\bcd /set {bootmgr} device partition=%unidade%: >>%frs_log%
Bcdedit /store %unidade%:\boot\bcd /set {memdiag} device partition=%unidade%: >>%frs_log%
bcdboot C:\Windows /s S: /f ALL >>%frs_log%
@echo off
echo. &echo fim do reparo&echo. >>%frs_log%
pause
goto menuprincipal

:op4_erro
echo vc nao selecionou nenhuma unidade ou uma unidade invalida
echo favor selecione uma opcao valida (sem :)
pause
goto op4

:op5
shutdown /r /fw
pause
goto menuprincipal

:op6
set unidade=0
echo Selecione a unidade que deseja executar o checkdisk
echo somente a letra da unidade sem os :
 Set /P unidade= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
  If %unidade% equ 0 goto op6_erro
 @echo on
CHKDSK /F/V/R/X %unidade%:
@echo off
pause
goto menuprincipal

:op6_erro
echo vc nao selecionou nenhuma unidade ou uma unidade invalida
echo favor selecione uma opcao valida (sem :)
pause
goto op6

:op7
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo           Foi testado e funciona perfeitamente do Windows XP ao 8.1
echo      Foi testado e funciona perfeitamente do Windows 2000 ao 2012 server
echo.
echo                    Projeto de Luciano Branco iniciado em 2024
echo.
echo           O Anti-Update bloqueia atualizacao de: Windows, Corel e Adobe
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo.&echo.&echo.
pause
echo O trabalho Ferramenta de Reparo Simples de Luciano Branco
echo está licenciado com uma Licença Creative Commons
echo Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional.
echo.&echo.&echo.
pause
goto menuprincipal

:op8
start "" cmd
start "" notepad
goto menuprincipal

:op9
echo arquivo de log: %frs_log%
if not exist "%~dp0reparoboot.log" echo arquivo de log criado em %date% - %time% > %frs_log%

echo. >> %frs_log%
echo teste do arquivo de log %date% - %time% >> %frs_log%
echo. >> %frs_log%
echo.
pause
echo abrindo no blocode notas
start "" notepad %frs_log%
pause
goto menuprincipal

:opa
set tempfile="%TEMP%\tmp_disk.dsk"
cd  %SystemRoot%\system32
echo.&echo   ...:: Removendo disco com seguranca ::...&echo.
echo   Selecione o numero do volume do disco (se o disco tiver multiplos volumes, selecione qualquer um deles)
echo.&echo.&echo list volume | diskpart | findstr /C:Volume /C:---&echo.
set /p volume="   Selected volume: "
echo.
echo select volume %volume% >>%tempfile%
echo offline disk >>%tempfile%
echo online disk >>%tempfile%
diskpart /s %tempfile% | findstr /C:"not valid"
if "%ERRORLEVEL%"=="1" (
  echo   a Unidade foi desbloqueada com sucesso. eh seguro remover agora...
  pause
)
del /F %tempfile%
goto menuprincipal

:fim
endlocal
goto :eof


:: incluir na proxima atualização
::
:: https://www.ventoy.net/en/experience_rebuildBCD.html
:: https://answers.microsoft.com/pt-br/windows/forum/all/bootrec-rebuildbcd-arquivo-ou-pasta-corrompido/3ece9339-58a4-4f2c-b92e-643c61222c29
:: https://www.lifewire.com/how-to-rebuild-the-bcd-in-windows-2624508
