@echo off
color 17
:: definindo variaveis
	set app=UnDefender 
	set build=1.1
	set data=13/abr/24
	set NewTitle=%app% v%build%
	set opcao=0
	set linha=================================================================================
	set github=https://github.com/llbranco/scripts
	set ms_ip=23.99.10.11,131.107.113.238,64.4.54.22,65.55.252.71,207.46.223.94,207.68.166.254,64.4.54.32,65.52.108.29,65.55.252.63,65.55.252.92,65.55.252.93,65.55.252.43,111.221.29.177,157.56.74.250,168.63.108.233,157.56.91.77,157.56.91.77,191.232.139.254,194.44.4.200,194.44.4.208,65.52.100.7,65.52.100.9,65.52.100.11,65.52.100.91,65.52.100.92,65.52.100.93,65.52.100.94,157.56.77.139,64.4.54.22,204.79.197.200,68.232.34.200,134.170.58.121,134.170.58.123,134.170.53.29,66.119.144.190,134.170.58.189,134.170.58.118,,134.170.53.30,134.170.51.190,64.4.6.100,65.55.39.10,134.170.185.70,104.82.22.249,204.79.197.200,134.170.115.60,131.107.113.238,157.56.121.89,23.102.21.4,207.46.194.25,157.55.129.21,173.194.113.220,173.194.113.219,216.58.209.166,157.56.91.82,157.56.23.91,104.82.14.146,207.123.56.252,185.13.160.61,8.254.209.254,134.170.115.60,207.46.101.29,104.82.22.249,65.55.108.23,23.218.212.69,204.79.197.200,64.4.54.32,68.232.34.200,65.52.100.7,65.52.100.91,65.55.252.63,68.232.34.200,198.78.208.254,185.13.160.61,185.13.160.61,8.254.209.254,207.123.56.252
	set fw_name=telemetry from microsoft

::rename %0 "%app%_v%build%.bat"

::permitindo acentuação
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 850>nul

:menu
title %newtitle%
set opcao=
cls&ver
echo ==============================================================%data%=========
echo ..%NewTitle%..
echo %linha%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                 Projeto de Luciano Branco iniciado em 10/04/2024
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestões ou críticas: thelucianobranco@gmail.com
echo			%github%
echo %linha%
echo.
echo                               Selecione uma Opção
echo.
echo %linha%
echo	 1  - Tornar o Windows Defender mansinho pra cracks, keygen e ativadores
echo	 2  - Tornar o Windows Defender a MERDA que sempre foi
echo	 3  - Bloquear telemetria da Microsoft via firewall
echo	 9  - Sobre
echo %linha%
echo.
	Set /P opcao=	Tecle a opção desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %opcao% equ 0 goto fim
	If %opcao% equ 1 goto undefender
	if %opcao% equ 2 goto redefender
	if %opcao% equ 3 goto telemetria
	If %opcao% equ 9 goto sobre
goto fim

:fim
	set vCabeca=
	set vVersao=
	set vData=
	set vRelease=
	set NewTitle=
	set Title=
	set test=
	set subm=
	set opcao=
exit

:Sobre
title %NewTitle% - Sobre
echo =================================== Sobre =====================================
echo %app% versão %build% iniciado em 10/abr/24, data da versão atual:%data%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugestões ou criticas: thelucianobranco@gmail.com
echo			%github%
echo %linha%
echo UnDefender de Luciano Branco é licenciado sob uma Licenca Creative Commons
echo Atribuição Uso não comercial Compartilhamento pela mesma licença 3.0 Unported.
echo http://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os créditos
echo ao criador (Luciano Branco / thelucianobranco@gmail.com)
echo.
echo caso modifique o código só poderá distribui-lo utilizando a mesma licença
echo gratuita e tambem permitindo modificação ao SEU código!!!
echo.
echo Permissões alem do escopo dessa licença podem estar disponíveis atravez do email
echo thelucianobranco@gmail.com
echo.
echo %linha%
echo piadas a parte, agora falando sério
echo eu não promovo a pirataria, esse script serve apenas para estudo
echo se você gosta de um sistema operacional ou app, recomendo que compre a licença do mesmo
echo %linha%
echo.
	Set /P licenca=	Tecle 1 depos [ENTER] para ver a licença ou apenas [ENTER] para fechar: 
	Cls
	If %licenca% equ 1 start "" http://creativecommons.org/licenses/by-nc-sa/3.0
goto menu

:undefender
echo.
echo %linha%
echo %app% está fazendo suas mandingas e instalando proteções
echo para tornar o defender manso como uma cadelinha mimada
echo %linha%
echo.
echo aguarde...
for %%a in (
%windir%\system32\SppExtComObjHook.dll
%windir%\KMS-R@1n.exe
%windir%\KMS-R@1nHook.dll
%windir%\KMS-R@1nHook.exe
) do (
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "&{Add-MpPreference -ExclusionPath "%%a" -Force|Add-MpPreference -ExclusionProcess "%%a" -Force}"
)

for %%b in (
.exe
.msi
.rar
.zip
.7z
.gz
.inf
.dll
.cab
.ini
.bin
.iso
.img
.bat
.cmd
.ps1
.efi
.wim
.esd
) do (
powershell.exe -NoLogo -command "&{Add-MpPreference -ExclusionExtension "%%b" -Force}"
)
pause
goto menu

:redefender
echo.
echo %linha%
echo entendi, vc gosta que o windows defender seja uma mala
echo.
echo %app% está fazendo suas mandingas e desfazendo as alterações
echo para tornar o defender chato como um pinscher... só late e treme mas não defende nada
echo %linha%
echo.
echo aguarde...
for %%a in (
%windir%\system32\SppExtComObjHook.dll
%windir%\KMS-R@1n.exe
%windir%\KMS-R@1nHook.dll
%windir%\KMS-R@1nHook.exe
) do (
powershell.exe -NoLogo -command "&{Remove-MpPreference -ExclusionPath "%%a" -Force|Remove-MpPreference -ExclusionProcess "%%a" -Force}"
)

for %%b in (
.exe
.msi
.rar
.zip
.7z
.gz
.inf
.dll
.cab
.ini
.bin
.iso
.img
.bat
.cmd
.ps1
.efi
.wim
.esd
) do (
powershell.exe -NoLogo -command "&{Remove-MpPreference -ExclusionExtension "%%b" -Force}"
)
pause
goto menu

:telemetria
echo adicionando regras de firewall para bloquear telemetrias da microsoft (por ip)
netsh advfirewall firewall add rule name="%fw_name%" dir=out action=block remoteip=%ms_ip% enable=yes
pause
goto menu
