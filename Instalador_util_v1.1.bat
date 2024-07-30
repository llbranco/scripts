@echo off
:: Definindo variaveis do ambiente
setlocal enabledelayedexpansion
color 71
set build=1.1
set date=30/jul/24
set ano=2024
set versao=Instalador de utilitarios ver: %build% - %date%

rename %~f0 "Instalador_util_v%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:: no caso de erro de login do winget rodar o comando
:: Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

:instalador
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
:: Avast
XPDNZJFNCR1B07
) do (
title  %versao% -- Instalando %%a -- By: llbranco
echo instalando %%a
winget install -e --id %%a --verbose
echo.&echo.%echo.
)
pause
