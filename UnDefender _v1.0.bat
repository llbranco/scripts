@echo off
color 17
:: definindo variaveis
	set app=UnDefender 
	set build=1.0
	set data=10/abr/24
	set NewTitle=%app% v%build%
	set opcao=0
	set linha=================================================================================
	set github=https://github.com/llbranco/scripts

rename %0 "%app%_v%build%.bat"

::permitindo acentuaá∆o
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
echo            Duvidas, sugest‰es ou cr°ticas: thelucianobranco@gmail.com
echo			%github%
echo %linha%
echo.
echo                               Selecione uma Opá∆o
echo.
echo %linha%
echo	 1  - Tornar o Windows Defender mansinho pra cracks, keygen e ativadores
echo	 2  - Tornar o Windows Defender a MERDA que sempre foi
echo	 9  - Sobre
echo %linha%
echo.
	Set /P opcao=	Tecle a opá∆o desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %opcao% equ 0 goto fim
	If %opcao% equ 1 goto undefender
	if %opcao% equ 2 goto redefender
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
echo %app% vers∆o %build% iniciado em 10/abr/24, data da vers∆o atual:%data%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugest‰es ou criticas: thelucianobranco@gmail.com
echo			%github%
echo %linha%
echo UnDefender de Luciano Branco Ç licenciado sob uma Licenca Creative Commons
echo Atribuiá∆o Uso n∆o comercial Compartilhamento pela mesma licenáa 3.0 Unported.
echo http://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os crÇditos
echo ao criador (Luciano Branco / thelucianobranco@gmail.com)
echo.
echo caso modifique o c¢digo s¢ poder† distribui-lo utilizando a mesma licenáa
echo gratuita e tambem permitindo modificaá∆o ao SEU c¢digo!!!
echo.
echo Permiss‰es alem do escopo dessa licenáa podem estar dispon°veis atravez do email
echo thelucianobranco@gmail.com
echo.
echo %linha%
echo piadas a parte, agora falando sÇrio
echo eu n∆o promovo a pirataria, esse script serve apenas para estudo
echo se vocà gosta de um sistema operacional ou app, recomendo que compre a licenáa do mesmo
echo %linha%
echo.
	Set /P licenca=	Tecle 1 depos [ENTER] para ver a licenáa ou apenas [ENTER] para fechar: 
	Cls
	If %licenca% equ 1 start "" http://creativecommons.org/licenses/by-nc-sa/3.0
goto menu

:undefender
echo.
echo %linha%
echo %app% est† fazendo suas mandingas e instalando proteá‰es
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
powershell.exe -NoLogo -command "&{Add-MpPreference -ExclusionPath "%%a" -Force|Add-MpPreference -ExclusionProcess "%%a" -Force}"
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
goto menu

:redefender
echo.
echo %linha%
echo entendi, vc gosta que o windows defender seja uma mala
echo.
echo %app% est† fazendo suas mandingas e desfazendo as alteraá‰es
echo para tornar o defender chato como um pinscher... s¢ late e treme mas n∆o defende nada
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
goto menu