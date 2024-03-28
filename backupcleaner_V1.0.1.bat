@echo off
@%SystemDrive%
@prompt
@color 17
setlocal
set vCabeca=BackupCleaner! - Removedor de Arquivos Temporarios
set vVersao=1.0.1
set vData=26/03/2024
set vRelease=%vVersao%V    %vData%
set NewTitle=%vCabeca%     %vRelease%
set confirma=n
rename %0 "backupcleaner_V%vVersao%.bat"
set opcao=
:: pasta de backup
set drive=e:
set pasta=backup
set backup=%drive%\%pasta%
%drive%
cd %backup%

:menu
title %newtitle%
set opcao=
cls&ver
echo ======================================================================
echo ..%NewTitle%..
echo unidade: %drive%
echo pasta de backup definida para:
echo %backup%
echo caso deseja limpar outra pasta edite o script e mude a variavel backup
echo ======================================================================
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                 Projeto de Luciano Branco iniciado em 26/03/2024
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo ======================================================================
echo.
echo                               Selecione uma Opcao
echo.
echo ======================================================================
echo	 1  - limpar backup
echo	 2  - Alterar pasta de backup (atual: %backup%)
echo	 3  - compactar backup LZX (requer win10+)
echo	 9  - Sobre
echo ======================================================================
echo.
	Set /P opcao=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %opcao% equ 0 goto fim
	If %opcao% equ 1 goto limpar
	If %opcao% equ 2 goto trocarpasta
	if %opcao% equ 3 goto compact
	If %opcao% equ 9 goto sobre
goto fim

:limpar
title %newtitle% - Limpeza de Backup
echo pasta de backup %backup%
cd %backup%
echo.
echo preparando para limpar o backup
:: for recursivo
:: For /R "x:\xablau\Desktop\pasta_a_ser_deletada" %%G IN (*.tmp) do del "%%G"

::removendo arquivos executaveis ou com multiplas extensoes
echo deletando arquivos com ext variavel
pause
::for /R "%backup%" %%a in (
for %%a in (
anydesk
ShowMyPC*
AA_v3.5
unins000
uninst
uninstall
dotNetFx40_Full_setup
Baixaki_*
JavaSetup*
Silverlight_x64
GBPCEF
iGBPCEFsf
ChromeSetup
Firefox Installer
avast_free_antivirus_setup_online
) do (
del /f/s/q "%%a.exe"
del /f/s/q "%%a.msi"
del /f/s/q "%%a.rar"
del /f/s/q "%%a.zip"
del /f/s/q "%%a.7z"
del /f/s/q "bing.url"
del /f/s/q "windirstat.lnk"
)>>teste.txt
pause

::dir /b %temp% >temp.list
::for /f "delims=" %%a in (temp.list) do call rundll32.exe advpack.dll,DelNodeRunDLL32 "%temp%\%%a"

::removendo arquivos com extensoes fixas
echo deletando arquivos com ext fixa
for %%b in (
thumbs.db
thumbcache_*.db
desktop.ini
) do del /f/s/q %%b

goto jump
for %%x in (
launchtrayprocess
refreshgwxconfig
refreshgwxcontent
runappraiser
refreshgwxconfigandcontent
Logon
OutOfIdle
refreshgwxconfig-B
Logon-5d
MachineUnlock-5d
OutOfIdle-5d
OutOfSleep-5d
Time-5d
) do (
taskkill /f /IM gwx.exe
taskkill /f /IM gwxux.exe
taskkill /f /IM gwxuxworker.exe
schtasks /end /tn "microsoft\windows\setup\gwx\%%x"
schtasks /end /tn "microsoft\windows\setup\GWXTriggers\%%x"
schtasks /change /tn "microsoft\windows\setup\gwx\%%x" /DISABLE
schtasks /change /tn "microsoft\windows\setup\GWXTriggers\%%x" /DISABLE
)
pause
:jump
goto menu

:trocarpasta
set /p backup= digite a pasta que desejada (atual: %backup%):
echo.
echo vc escolheu a pasta %backup%
set /p confirma=continuar com a sua escolha (1)Sim ou (2)Nao para voltar a pasta padrao ?
	If %confirma% equ 1 goto menu
	If %confirma% equ 2 set backup=%drive%\%pasta%
goto menu

:compact
compact /c /s /a /i /exe:lzx "%backup%\*"
pause
goto menu

:sobre
title %NewTitle% - Sobre
echo อออออออออออออออออออออออออออออออออออ Sobre อออออออออออออออออออออออออออออออออออออ
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo licenciado sob uma Licenca Creative Commons
echo Atribuicaoo-Uso nao-comercial-Compartilhamento pela mesma licenca 3.0 Unported.
echo http://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os creditos
echo ao criador (Luciano Branco / thelucianobranco@gmail.com)
echo.
echo caso modifique o codigo so podera distribui-lo utilizando a mesma licenca
echo gratuita e tambem permitindo modificacao ao SEU codigo!!!
echo.
echo Permissoes alem do escopo dessa licenca podem estar disponivel atravez do email
echo thelucianobranco@gmail.com
echo.
echo.
	Set /P licenca=	Tecle 1 depos [ENTER] para ver a licenca ou apenas [ENTER] para fechar: 
	Cls
	If %licenca% equ 1 start "" http://creativecommons.org/licenses/by-nc-sa/3.0
goto menu

:fim
	echo on
	set vCabeca=
	set vVersao=
	set vData=
	set vRelease=
	set NewTitle=
	set vFlag=
	set vPath=
	set Title=
	set test=
	set subm=
	set opcao=
exit
