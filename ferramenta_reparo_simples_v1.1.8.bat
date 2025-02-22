@echo off & cd /d %~dp0
:: Definindo variaveis do ambiente
setlocal
color 71
set build=1.1.8
set date=22/out/24
set ano=2024
set versao=Ferramenta de reparo simples do windows ver: %build% - %date%
set linha=-------------------------------------------------------------------------------
:: set frs_log=%~dp0reparoboot.log
set frs_log=%~dp0reparoboot.log
if not exist "%frs_log%" echo arquivo de log criado em %date% - %time%>%frs_log%

:: Variaveis definidas
rename %~f0 "ferramenta_reparo_simples_v%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:menuprincipal
set opcao=0
cls
echo %linha%
echo 	%versao% %instalado%
echo 	Instalacao do windows: %windir%
echo                               Selecione uma Opcao
echo %linha%
echo 1  - Limpezas/correcoes usando DISM
echo 2  - Pular requisitos do windows 11
echo 3  - SFC /Scannow
echo 4  - Reparar Boot / BCD
echo 5  - Reiniciar para BIOS/UEFI
echo 6  - CHKDSK /F/V/R/X X: (SELECIONE A UNIDADE)
echo 7  - Sobre
echo 8  - Abrir janelas cmd, powershell e notepad
echo 9  - Arquivo de log (%frs_log%)
echo A  - Remover/ejetar unidade
echo B  - Converter sistema EFI2BIOS e BIOS2EFI
echo C  - Mudar Perfil de energia
echo D  - Desabilitar estampa de ultimo acesso (melhora vel de acesso do disco)
echo E  - Backup wi-fi
echo F  - Habilitar GPEDIT.MSC (para Win Home e SL)
echo G  - Desabilitar UAC
echo H  - Habilitar/Desabilitar menu F8 no windows
echo S  - Verificar S.M.A.R.T.
echo 0  - Sair                                           https://github.com/llbranco
echo %linha%
echo Arquivo de log: %frs_log% & echo.

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 0 goto fim
 goto op%opcao%
 echo vc escolheu a opcao %opcao%
 pause
goto menuprincipal

:op1
echo %linha%
echo Selecione a opcao desejada
echo %linha%
echo.
echo opcoes 1 e 2 executam limpezas no windows
echo 1  - DISM /online /Cleanup-Image /StartComponentCleanup
echo 2  - DISM /Online /Cleanup-image /RestoreHealth
echo 3  - Desabilitar espaco reservado win10/11
echo 4  - Habilitar   espaco reservado win10/11
set dism=
 Set /P dism= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %dism% equ 0 goto fim
 goto dism%dism%
goto fim

:dism1
echo.>>%frs_log%
echo executando "DISM /online /Cleanup-Image /StartComponentCleanup" >>%frs_log%
@echo on
::for /f "delims=" %%i in (
DISM /online /Cleanup-Image /StartComponentCleanup
::) do (
::    echo [%date%, %time%] %%i >> %frs_log%
::)
@echo off
pause
goto menuprincipal

:dism2
echo.>>%frs_log%
echo executando "DISM /Online /Cleanup-image /RestoreHealth" >>%frs_log%
@echo on
::for /f "delims=" %%i in (
DISM /Online /Cleanup-image /RestoreHealth
::) do (
::    echo [%date%, %time%] %%i >> %frs_log%
::)
@echo off
pause
goto menuprincipal

:dism3
echo.>>%frs_log%
echo executando "DISM /Online /Set-ReservedStorageState /State:Disabled​" >>%frs_log%
@echo on
DISM /Online /Set-ReservedStorageState /State:Disabled​
@echo off
pause
goto menuprincipal

:dism4
echo.>>%frs_log%
echo executando "DISM /Online /Set-ReservedStorageState /State:Enable​" >>%frs_log%
@echo on
DISM /Online /Set-ReservedStorageState /State:Enable​
@echo off
pause
goto menuprincipal

:op2
@echo off
reg add HKLM\System\Setup\LabConfig /v BypassTPMCheck /t reg_dword /d 0x00000001 /f
reg add HKLM\System\Setup\LabConfig /v BypassSecureBootCheck /t reg_dword /d 0x00000001 /f
reg add HKLM\System\Setup\LabConfig /v BypassRAMCheck /t reg_dword /d 0x00000001 /f
reg add HKLM\System\Setup\LabConfig /v BypassStorageCheck /t reg_dword /d 0x00000001 /f
reg add HKLM\System\Setup\LabConfig /v BypassCPUCheck /t reg_dword /d 0x00000001 /f
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

echo.>>%frs_log%
echo Executando reparo de sfc /scannow na unidade %unidade%: >> %frs_log%
@echo on
::for /f "delims=" %%i in (
sfc /scannow /offbootdir=%unidade%:\ /offwindir=%unidade%:\Windows
::) do (
::    echo [%date%, %time%] %%i >> %frs_log%
::)
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
echo.>>%frs_log%
echo executando reparo de boot / BCD na unidade %unidade%:>>%frs_log%

@echo on
::for /f "delims=" %%i in (
Bcdedit /export %unidade%:\BCD_Backup
Bootrec /FixMbr
Bootrec /fixboot
Bootrec /rebuildbcd
::) do (
::    echo [%date%, %time%] %%i >> %frs_log%
::)
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
echo.>>%frs_log%
echo executando "BCDEdit em %unidade%" >>%frs_log%
@echo on
::for /f "delims=" %%i in (
Bcdedit /store %unidade%:\boot\bcd /set {bootmgr} device partition=%unidade%:
Bcdedit /store %unidade%:\boot\bcd /set {memdiag} device partition=%unidade%:
bcdboot C:\Windows /s S: /f ALL
::) do (
::    echo [%date%, %time%] %%i >> %frs_log%
::)
@echo off
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
echo.>>%frs_log%
echo executando "CHKDSK /F/V/R/X em %unidade%" >>%frs_log%
@echo on
::for /f "delims=" %%i in (
CHKDSK /F/V/R/X %unidade%:
::) do (
::    echo [%date%, %time%] %%i >> %frs_log%
::)
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
echo %linha%
echo                    Projeto de Luciano Branco iniciado em 2024
echo                                   https://github.com/llbranco
echo %linha%
echo.&echo.&echo.
echo O trabalho Ferramenta de Reparo Simples de Luciano Branco
echo esta licenciado com uma Licenca Creative Commons
echo Atribuicao-NaoComercial-CompartilhaIgual 4.0 Internacional.
echo %linha%
echo.&echo.&echo.
choice /C:SN /M "Gostaria de abrir o GitHub do projeto?"
IF %ERRORLEVEL% equ 1 goto github
IF %ERRORLEVEL% equ 2 goto menuprincipal
goto menuprincipal

:github
start "" https://github.com/llbranco/scripts
goto menuprincipal

:op8
start "" cmd
start "" notepad
start "" powershell.exe
goto menuprincipal

:op9
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
pause
goto menuprincipal

:opb
echo converter uma instalacao de BIOS pra UEFI ou vice-versa
echo.
echo escolha uma opcao
echo 1 - converter o sistema que estou logado de BIOS(MBR) para UEFI(GPT)
echo 2 - BIOS para UEFI usando disco de recuperacao ou instalacao (win10 ou 11)
echo 3 - converter de UEFI para BIOS
 Set /P mbr2gpt= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %mbr2gpt% equ 0 goto fim
 goto mbr2gpt%mbr2gpt%
 echo vc escolheu a opcao %mbr2gpt%
 pause
goto menuprincipal

:mbr2gpt1
echo vc escolheu a opcao de converter o seu sistema atualmente instalado
echo supostamente BIOS/MBR para UEFI/GPT
echo.
echo confirme 2x para continar ou feche para cancelar
pause
pause
mbr2gpt.exe /convert /allowfullOS
pause
goto menuprincipal

:mbr2gpt2
echo vc escolheu a opcao de converter o seu sistema via recovery ou disco de instacao
echo supostamente BIOS/MBR para UEFI/GPT
echo.
echo confirme 2x para continar ou feche para cancelar
pause
pause
mbr2gpt.exe /validate
mbr2gpt.exe /convert
pause

:mbr2gpt3
echo por enquanto ainda nao consigui uma forma segura de fazer isso via Batch
echo sendo assim
echo.
echo recomendo usar um dos softwares abaixo para converter seu sistema:
echo EaseUS Partititon Master
echo ou
echo Disk Genius
echo.
echo use a opcao "converter disco para MBR"
pause
goto menuprincipal

:opc
cls
set power=0
echo selecione um dos perfis de energia a seguir
echo Dica: copie e cole para melhor resultado
echo.
echo scheme_max			power saver
echo scheme_min			high performance
echo scheme_balanced	balanced
echo 8 para deletar o plano personalizado
echo 9 para um plano personalizado


echo.
 Set /P power= Digite o nome do perfil que deseja [ENTER] para fechar: 
 Cls
 If %power% equ 0 goto opc
 if %power% equ 9 goto opc_custom
 
 echo vc escolheu "%power%"
 pause
powercfg -duplicatescheme "%power%"
powercfg -setactive "%power%"
%windir%\System32\control.exe powercfg.cpl
goto menuprincipal

:opc_del
powercfg /delete e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /delete "InfoBR"
echo retornando ao menu de perfil de energia
pause
goto opc

:opc_custom
echo vc escolheu o plano personalizado
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /changename e9a42b02-d5df-448d-aa00-03f14749eb61 "InfoBR"
echo .
%windir%\System32\control.exe powercfg.cpl
pause
goto menuprincipal

:opd
echo desabilitando estampa de ultimo acessodos arquivos
echo.
echo isso melhora o tempo de acesso especialmente em HD
echo ou SSD barato
fsutil.exe behavior set disableLastAccess 1
pause
goto menuprincipal

:ope
echo exportando wifi para arquivo xml
echo.
netsh.exe wlan show profiles
netsh.exe wlan export profile key=clear
pause
goto menuprincipal

:opf
echo habilitando GPEDIT
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >"%temp%\List.txt "
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>"%temp%\List.txt "

for /f %%i in ('findstr /i . "%temp%\List.txt" 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i" 
echo.
echo.
echo para habilitar tela de logon no win 8, 8.1, 10 e 11
echo utilize esse metodo:
echo.
echo 1. Clique no iniciar, no campo pesquisa digite: gpedit.msc, e abra o mesmo.
echo 2. Abra o caminho Configuracao do Computador, Modelo Administrativo, Sistema, Logon.
echo 3. Clique duas vezes em "Sempre Usar Logon Classico, selecione "Habilitar" e clique em Ok.
pause
goto menuprincipal

:opg
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f
pause
goto menuprincipal

:oph
cls
set bootmenu=0
echo Escolha uma opcao para editar o menu F8
echo.
echo NOTE QUE SO FUNCIONA COM FASTBOOT DESABILITADO
echo.
echo 1 Habilitar	displaybootmenu (para 30seg antes de iniciar o windows)
echo 2 Desabilitar	displaybootmenu (default)
echo.
echo 3 Habilitar	bootmenupolicy	(habilita o F8)
echo 4 Desabilitar	bootmenupolicy	(desabilita o F8)
echo.
echo 5 Entrar no modo recovery
echo 0 VOLTAR
echo.
 Set /P bootmenu= Digite o nome do perfil que deseja [ENTER] para fechar: 
 Cls
 If %bootmenu% equ 0 goto menuprincipal
 If %bootmenu% equ 1 goto oph1
 if %bootmenu% equ 2 goto oph2
 If %bootmenu% equ 3 goto oph3
 If %bootmenu% equ 4 goto oph4
 If %bootmenu% equ 5 goto oph5
 
goto oph

:oph1
echo habilitando displaybootmenu
bcdedit /set {bootmgr} displaybootmenu yes
pause
goto oph

:oph2
echo desabilitando displaybootmenu
bcdedit /set {bootmgr} displaybootmenu no
pause
goto oph

:oph3
echo habilitando bootmenupolicy
bcdedit /set {current} bootmenupolicy Legacy
pause
goto oph

:oph4
echo desabilitando bootmenupolicy
bcdedit /set {current} bootmenupolicy Standard
pause
goto oph

:oph5
echo acessando o menu recovery
shutdown /r /o /f /t 00
pause
goto oph

:ops
wmic diskdrive get model,name,serialnumber,status
pause
goto menuprincipal

:fim
endlocal
goto :eof

:: incluir na proxima atualização
::
:: https://www.ventoy.net/en/experience_rebuildBCD.html
:: https://answers.microsoft.com/pt-br/windows/forum/all/bootrec-rebuildbcd-arquivo-ou-pasta-corrompido/3ece9339-58a4-4f2c-b92e-643c61222c29
:: https://www.lifewire.com/how-to-rebuild-the-bcd-in-windows-2624508
