@echo off
:: Definindo variaveis do ambiente
setlocal enabledelayedexpansion
color 71
set build=1.6
set date=11/mar/25
set ano=2025
set versao=Instalador de utilitarios ver: %build% - %date%

::reiniciar não será mais necessario para fins de compatibilidade com irm/wget
::rename %~f0 "Instalador_util_v%build%.bat"

title  %versao% -- %ano% -- By: llbranco

if _%1_==_payload_  goto :payload
cls

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

rem Verificar se o comando "winget" existe
where winget >nul 2>nul
if %errorlevel%==0 (
    echo Winget já está instalado. Pulando o download.
    goto next
) else (
    echo instalando nuget
powershell.exe -NoLogo -command "&{Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted}"
echo.
echo baixando script de instalacao do winget
powershell.exe -NoLogo -command "&{Install-Script -Name winget-install -Force}"
echo.
echo permitindo execucao de script
powershell.exe -NoLogo -command "&{Set-ExecutionPolicy Unrestricted}"
echo.
echo instalando winget
powershell.exe -NoLogo -command "&{winget-install.ps1}"
)

echo Iniciando a instalação do Winget...
powershell -Command "Add-AppxPackage -Path '%DOWNLOAD_DIR%\%FILE_NAME%'"

:next
echo O Winget está pronto para ser usado. Continuando o processo...

echo desabilitando o Windows Recall
reg add HKLM\SOFTWARE\Microsoft\PolicyManager\default\WindowsAI\TurnOffWindowsCopilot /t REG_DWORD /v value /d 1 /f

reg add HKLM\SOFTWARE\Microsoft\PolicyManager\default\WindowsAI\DisableAIDataAnalysis /t REG_DWORD /v value /d 1 /f

reg add HKCU\Software\Policies\Microsoft\Windows\WindowsAI /v DisableAIDataAnalysis /t REG_DWORD /d 1 /f

reg add HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f

reg add HKLM\Software\Policies\Microsoft\Windows\WindowsAI /v DisableAIDataAnalysis /t REG_DWORD /d 1 /f

reg add HKLM\Software\Policies\Microsoft\Windows\WindowsCopilot /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f

Dism /Online /Disable-Feature /Featurename:Recall


for %%a in (
Google.Chrome
Mozilla.Firefox
VideoLAN.VLC
CodecGuide.K-LiteCodecPack.Full
RARLab.WinRAR
WinRAR.ShellExtension_d9ma7nkbkv4rp
Unchecky.Unchecky
Microsoft.DirectX
AnyDeskSoftwareGmbH.AnyDesk
Adobe.Acrobat.Reader.64-bit
Oracle.JavaRuntimeEnvironment
Microsoft.DotNet.Runtime.3_1
Microsoft.DotNet.Runtime.4
Microsoft.DotNet.Runtime.5
Microsoft.DotNet.Runtime.6
Microsoft.DotNet.Runtime.7
Microsoft.DotNet.Runtime.8
Microsoft.VCRedist.2005.x86
Microsoft.VCRedist.2005.x64
Microsoft.VCRedist.2008.x86
Microsoft.VCRedist.2008.x64
Microsoft.VCRedist.2010.x86
Microsoft.VCRedist.2010.x64
Microsoft.VCRedist.2012.x86
Microsoft.VCRedist.2012.x64
Microsoft.VCRedist.2013.x86
Microsoft.VCRedist.2013.x64
Microsoft.VCRedist.2015+.x86
Microsoft.VCRedist.2015+.x64
) do (
title  %versao% -- Instalando %%a -- By: llbranco
echo instalando %%a
winget install -e --id %%a --verbose
echo.&echo.&echo.
)

title  %versao% -- %ano% -- By: llbranco

echo.
echo ativando winrar
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
)> "%programfiles%\WinRAR\rarreg.key"
start "" "%programfiles%\WinRAR\winrar.exe"

:office
echo preparando para instalar o office
echo.
echo .
echo ..
echo ...
"%programfiles%\WinRAR\rar" x "\\host\apps\office\Office 2013-2024 C2R Install + Lite v7.7.7.5.rar" "%temp%\office\"
start "" "%temp%\office\Office 2013-2024 C2R Install + Lite v7.7.7.5\OInstall_x64.exe"

echo aguarde o termino da instalacao do office antes de instalar o avast
echo pois o avast pode excluir o instalador do office
echo.
pause
pause
echo instalando o avast
winget install -e --id XPDNZJFNCR1B07 --verbose

::echo importando configuracao do avast
::start "" avast.avastconfig
pause
goto :eof
