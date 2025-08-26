@echo off
:: Definindo variaveis do ambiente
setlocal enabledelayedexpansion
color 71
set build=1.9.8.2
set date=26/ago/25
set ano=2025
set versao=Instalador de utilitarios ver: %build% - %date%
set linha= ===============================================================================

set office="\\host\util\office\Office 2013-2024.rar" "%temp%\office\"
set officetmp="%temp%\office\Office 2013-2024 C2R Install + Lite v7.7.7.5\OInstall_x64.exe"

title  %versao% -- %ano% -- By: llbranco
::reiniciar não será mais necessario para fins de compatibilidade com irm/wget
::rename %~f0 "Instalador_util_v%build%.bat"

::incluir itens no "win + x"
::(parte superior)
::%LocalAppdata%\Microsoft\Windows\WinX\Group3
::(parte intermediaria)
::%LocalAppdata%\Microsoft\Windows\WinX\Group2
::(parte inferior)
::%LocalAppdata%\Microsoft\Windows\WinX\Group1

::habilitar F8 no inicio do Windows
::bcdedit /set {bootmgr} displaybootmenu yes

::gerar relatorio de uso de bateria
::powercfg /batteryreport /output "%USERPROFILE%\Desktop\relatorio_bateria.html" /Duration days


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


::obtendo data da instalação do windows
for /f "tokens=2,* delims=:" %%A in ('systeminfo ^| findstr /i "original"') do (
    set "instalacao=%%A:%%B"
)

:: Remove espaços em excesso (opcional)
set "instalacao=%instalacao:~1%"



:payload
cls
title  %versao% -- %ano% -- By: llbranco
echo %linha%
echo .. %versao% -- By: llbranco ..
echo %linha%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo data da intalacao desse windows: %instalacao%
echo           https://github.com/llbranco
echo %linha%
echo.
echo                               Selecione uma Opcao
echo.
echo %linha%
echo	 1  - Instalar util (via winget)
echo	 a  - Instalar util (via choco)
echo	 2  - Ativadores (online)
echo	 3  - Winutil (ChrisTitus)
echo	 4  - Windows 11 liberar SMB (compartilhamento de arquivos)
echo	 5  - Atualizar todos os apps via winget
echo	 6  - Apps para LTSC
echo	 x  - Desinstalar atualizacao do windows (ex: kb5063878)
echo %linha%
echo.
	Set /P opcao=	Tecle a opção desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
 If %opcao% equ 0 goto fim
 goto op%opcao%
goto fim

:opa
cls
echo instalando chocolatey
::download install.ps1
::powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('https://community.chocolatey.org/install.ps1','%DIR%install.ps1'))"

powershell.exe -NoLogo -command "&{irm https://community.chocolatey.org/install.ps1 | iex}"

::run installer
::powershell.exe -NoLogo -Command "&{'%DIR%install.ps1' %*}"
echo choco instalado
echo.
echo instalando pacotes
for %%a in (
unchecky
winget
googlechrome
Firefox
vlc
k-litecodecpackfull
winrar
directx
anydesk
javaruntime
openal
xna
dotnetfx
dotnetcore3-desktop-runtime
dotnet-all
vcredist-all
::2015 a 2022
vcredist140
::vcredist2005
::vcredist2008
::vcredist2010
::vcredist2012
::vcredist2013
::vcredist2015
) do (
title  %versao% -- Instalando %%a -- By: llbranco
echo instalando %%a
::powershell.exe -NoLogo -Command "&{choco install %%a --accept-license --yes --args-global --ignore-checksums}"
choco install %%a --accept-license --yes --args-global --ignore-checksums
echo.&echo.&echo.
)
echo voltando ao menu
echo.
call :next
echo retornando ao menu
pause
goto payload


:op2
Cls
echo %linha%
echo.
echo qual ativador deseja usar?
echo.
echo %linha%
echo	 1  - KMS VL ALL
echo	 2  - MAS activator (MassGrave)
echo	 3  - menu anterior
echo.
	Set /P opcao=	Tecle a opção desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
 If %opcao% equ 0 goto fim
 goto at%opcao%
goto fim

:at1
echo KMS VL All
cd %temp%
powershell.exe -NoLogo -Command "&{Invoke-RestMethod https://raw.githubusercontent.com/abbodi1406/KMS_VL_ALL_AIO/master/KMS_VL_ALL_AIO.cmd -OutFile 'KMS_VL_ALL_AIO.cmd'}"
if exist "%TEMP%\KMS_VL_ALL_AIO.cmd" (
    call "%TEMP%\KMS_VL_ALL_AIO.cmd"
) else (
    echo Erro: O arquivo não foi baixado corretamente!
)
pause
goto payload

:at2
echo MassGrave activator
powershell.exe -NoLogo -command "&{irm https://get.activated.win | iex}"
pause
goto payload

:at3
goto payload

:op3
echo winutil christitus
powershell.exe -NoLogo -command "&{irm "https://christitus.com/win" | iex}"
pause
goto payload

:op4
echo Desabilitando a assinatura de segurança SMB
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v RequireSecureNegotiate /t REG_DWORD /d 0 /f
echo reinicie o computador para aplicar as alteracoes
pause
goto payload


:op1
title  %versao% -- atualizando play store -- By: llbranco
:: echo abrindo a microsoft store para atualizar
:: nvidia control panel ::start ms-windows-store://pdp/?productid=9WZDNCRFHV7C
:: start ms-windows-store://

echo tentando atualizar a microsoft store
powershell.exe -NoLogo -command "&{winget upgrade --all -s msstore --include-unknown}"
echo.
echo tentativa 2 de atualizar a microsoft store
powershell.exe -NoLogo -command "&{Get-CimInstance -Namespace "Root\cimv2\mdm\dmmap" -ClassName "MDM_EnterpriseModernAppManagement_AppManagement01" | Invoke-CimMethod -MethodName UpdateScanMethod}"

title  %versao% -- instalando winget -- By: llbranco
echo Verificar se o comando "winget" existe
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

echo Iniciando a instalacao do Winget...
powershell -Command "Add-AppxPackage -Path '%DOWNLOAD_DIR%\%FILE_NAME%'"
echo O Winget deve estar pronto para ser usado. Continuando o processo...

call :next

::atualizando winget
powershell.exe -NoLogo -command "&{winget upgrade --id Microsoft.Winget --accept-source-agreements --accept-package-agreements}"

::winget uninstall OneDriveSetup.exe

:: revomido Adobe.Acrobat.Reader.64-bit e adicionado onedrive
for %%a in (
Google.Chrome
Mozilla.Firefox
VideoLAN.VLC
CodecGuide.K-LiteCodecPack.Full
RARLab.WinRAR
WinRAR.ShellExtension_d9ma7nkbkv4rp
Microsoft.DirectX
AnyDeskSoftwareGmbH.AnyDesk
Oracle.JavaRuntimeEnvironment
Microsoft.OneDrive
OpenAL.OpenAL
Microsoft.XNARedist
Microsoft.DotNet.Runtime.3
Microsoft.DotNet.Runtime.3_1
Microsoft.DotNet.Runtime.4
Microsoft.DotNet.Runtime.5
Microsoft.DotNet.Runtime.6
Microsoft.DotNet.Runtime.7
Microsoft.DotNet.Runtime.8
Microsoft.DotNet.DesktopRuntime.8
Microsoft.VCRedist.2005.x86
Microsoft.VCRedist.2005.x64
Microsoft.VCRedist.2008.x86
Microsoft.VCRedist.2008.x64
Microsoft.VCRedist.2010.x86
Microsoft.VCRedist.2010.x64
Microsoft.VCRedist.2012x86
Microsoft.VCRedist.2012.x86
Microsoft.VCRedist.2012.x64
Microsoft.VCRedist.2013.x86
Microsoft.VCRedist.2013.x64
Microsoft.VCRedist.2015.x86
Microsoft.VCRedist.2015.x64
Microsoft.VCRedist.2015+.x86
Microsoft.VCRedist.2015+.x64
) do (
title  %versao% -- Instalando %%a -- By: llbranco
echo instalando %%a
::winget install -e --id %%a --verbose
powershell.exe -NoLogo -Command "&{winget install %%a --force --accept-package-agreements --accept-source-agreements}"
echo.&echo.&echo.
)
echo instalando unchecky
powershell.exe -NoLogo -Command "&{winget install -e --id Unchecky.Unchecky --force --accept-package-agreements --accept-source-agreements}"

echo aguarde o termino da instalacao do office antes de instalar o avast
echo pois o avast pode excluir o instalador do office
echo.
pause
pause
call :avast_wg
pause
goto :eof

:op5
title  %versao% -- atualizando todos os apps -- By: llbranco
echo atualizando aplicativos
powershell.exe -NoLogo -command "&{winget upgrade  --all --force --include-unknown --accept-package-agreements --accept-source-agreements}"
pause
goto payload

:op6
title  %versao% -- instalando apps para LTSC -- By: llbranco
for %%a in (
Microsoft.DesktopAppInstaller
Microsoft.StorePurchaseApp
Microsoft.WindowsStore
Microsoft.XboxIdentityProvider
) do (
title  %versao% -- Instalando %%a -- By: llbranco
echo instalando %%a
::winget install -e --id %%a --verbose
powershell.exe -NoLogo -Command "&{winget install %%a --force --accept-package-agreements --accept-source-agreements}"
)
pause
goto payload



:next
echo tentativa de desabilitar o Windows Recall
reg add HKLM\SOFTWARE\Microsoft\PolicyManager\default\WindowsAI\DisableAIDataAnalysis /t REG_DWORD /v value /d 1 /f
reg add HKCU\Software\Policies\Microsoft\Windows\WindowsAI /v DisableAIDataAnalysis /t REG_DWORD /d 1 /f
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsAI /v DisableAIDataAnalysis /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\PolicyManager\default\WindowsAI\TurnOffWindowsCopilot /t REG_DWORD /v value /d 1 /f
reg add HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsCopilot /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f

echo tentativa adicional de desativar recall
Dism /Online /Disable-Feature /Featurename:"Recall"

title  %versao% -- otimizacao e telemetria -- By: llbranco
echo habilitar impressora windows 10 e 11
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f

echo Mudando a associacao de URL http e https para o Chrome
reg add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v ProgId /t REG_SZ /d "ChromeHTML" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v ProgId /t REG_SZ /d "ChromeHTML" /f

echo removendo icone "reuniao" da barra de tarefas
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v HideSCAMeetNow /t REG_DWORD /d 1 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v HideSCAMeetNow /t REG_DWORD /d 1 /f

echo habilitando opcoes extras de energia
reg add HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowPowerSleep /v value /t REG_DWORD /d 1 /f

echo definindo perfil de energia
::alto desempenho
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
::equilibrado 381b4222-f694-41f0-9685-ff5bb260df2e
::economia a1841308-3541-4fab-bc81-f71556f20b4a

::habilitar maximo desempenho
::powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
::powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

echo definindo "meu computador" como padrao em vez de "acesso rapido"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f

echo habilitando tempo estimado de bateria
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v EnergyEstimationDisabled /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v UserBatteryDischargeEstimator /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v EnergyEstimationEnabled /t REG_DWORD /d 1 /f

echo otimizando privacidade e controle
echo.
echo inumeras meditas contra telemetria e configuracoes serao alteradas
echo essa etapa pode demorar
echo.
echo caso o defender perturbe, desative ele antes
ping 127.0.0.1 -n 5 >nul 2>&1
:: creditos https://github.com/RedAndBlueEraser/windows-10-enhance-2/blob/master/windows-10-enhance-privacy-and-control.ps1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightWindowsWelcomeExperience /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /v UserAuthPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v CdpSessionUserAuthzPolicy /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v NearShareChannelUserAuthzPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v RomeSdkChannelUserAuthzPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP\SettingsPage" /v BluetoothLastDisabledNearShare /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP\SettingsPage" /v NearShareChannelUserAuthzPolicy /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP\SettingsPage" /v RomeSdkChannelUserAuthzPolicy /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableCdp /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace" /v PenWorkspaceAppSuggestionsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /v AllowSuggestedAppsInWindowsInkWorkspace /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenOverlayEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v LockScreenOverlaysDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-314563Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v AutoUpdateEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v AutoDownloadAndUpdateMapData /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\$sid" /v OptOut /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableAutomaticRestartSignOn /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v OnlineServicesEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v DetailedFeedback /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsMSACloudSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsAADCloudSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353694Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightOnSettings /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v AllowInputPersonalization /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v AllowLinguisticDataCollection /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableTailoredExperiencesWithDiagnosticData /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v PeriodInNanoSeconds /t REG_QWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f
::desabilitando sms
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{21157C1F-2651-4CC1-90CA-1F28B02263F6}" /v Value /t REG_SZ /d Deny /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v Value /t REG_SZ /d Deny /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v Value /t REG_SZ /d Deny /f
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Suggested Sites" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCR\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI" /v NewTabPageDisplayOption /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v DefaultBrowserSettingEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v DefaultBrowserSettingEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v BrowserSignin /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BrowserSignin /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v TrackingPrevention /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TrackingPrevention /t REG_DWORD /d 3 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v DiagnosticData /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v DiagnosticData /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v PersonalizationReportingEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PersonalizationReportingEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v ResolveNavigationErrorsUseWebService /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ResolveNavigationErrorsUseWebService /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ResolveNavigationErrorsUseWebService /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ResolveNavigationErrorsUseWebService /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v AlternateErrorPagesEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v AlternateErrorPagesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AlternateErrorPagesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v AlternateErrorPagesEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge\CollectionsServicesAndExportsBlockList" /v 1 /t REG_SZ /d pinterest_suggestions /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\CollectionsServicesAndExportsBlockList" /v 1 /t REG_SZ /d pinterest_suggestions /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v UserFeedbackAllowed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v UserFeedbackAllowed /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v SpotlightExperiencesAndRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SpotlightExperiencesAndRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v NewTabPagePrerenderEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v NewTabPagePrerenderEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v NewTabPagePrerenderEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v NewTabPagePrerenderEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchPrivacy /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontReportInfectionInformation /t REG_DWORD /d 1 /f

::Telemetry related
reg add "HKLM\SOFTWARE\Policies\Microsoft\AppV\CEIP" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v DisableCustomerImprovementProgram /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v DisableCustomerImprovementProgram /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Messenger\Client" /v CEIP /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client" /v CEIP /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory /t REG_DWORD /d 1 /f

::Error Reporting related
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v AllOrNone /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v IncludeKernelFaults /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v IncludeMicrosoftApps /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v IncludeShutdownErrs /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v IncludeWindowsApps /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v DWNoFileCollection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v DWNoSecondLevelCollection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v DisableSendGenericDriverNotFoundToWER /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v DisableSendRequestAdditionalSoftwareToWER /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v AutoApproveOSDumps /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v AutoApproveOSDumps /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v BypassDataThrottling /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v BypassDataThrottling /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v BypassNetworkCostThrottling /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v BypassNetworkCostThrottling /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v BypassPowerThrottling /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v BypassPowerThrottling /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultConsent /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultConsent /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultOverrideBehavior /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultOverrideBehavior /t REG_DWORD /d 1 /f

::Windows Spotlight related
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableThirdPartySuggestions /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightOnActionCenter /t REG_DWORD /d 1 /f

::demais otmizações
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v MicrosoftEdgeDataOptIn /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v MicrosoftEdgeDataOptIn /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v AdsSettingForIntrusiveAdsSites /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AdsSettingForIntrusiveAdsSites /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundTemplateListUpdatesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundTemplateListUpdatesEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v BingAdsSuppression /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BingAdsSuppression /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v BuiltInDnsClientEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BuiltInDnsClientEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v MetricsReportingEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v MetricsReportingEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v PromotionalTabsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PromotionalTabsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Edge" /v ShowOfficeShortcutInFavoritesBar /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowOfficeShortcutInFavoritesBar /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v MSAOptional /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v ScenarioExecutionEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v DisableQueryRemoteServer /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoBalloonFeatureAdvertisements /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v PreventHandwritingDataSharing /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v PreventHandwritingDataSharing /t REG_DWORD /d 1 /f

::mais telemetria
reg add "HKCU\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v NoImplicitFeedback /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitEnhancedDiagnosticDataWindowsAnalytics /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDeviceNameInTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DisableTelemetryOptInChangeNotification /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DisableTelemetryOptInSettingsUx /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DORestrictPeerSelectionBy /t REG_DWORD /d 1 /f

echo permitir rede insegura windows 10 e 11
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f

::Connected User Experiences and Telemetry => Disabled
sc stop DiagTrack
sc config DiagTrack start=disabled
sc stop diagnosticshub.standardcollector.service
sc config diagnosticshub.standardcollector.service start=disabled

::Windows Error Reporting Service
sc stop WerSvc
sc config WerSvc start=disabled

::Windows Insider Service
sc stop wisvc
sc config wisvc start=disabled

::Scheduled tasks
::Telemetry and feedback related => Disabled
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable

::Office 15 Subscription Heartbeat => Disabled
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable

::mais telemetria
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\IE" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\IE" /v SqmLoggerRunning /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\Reliability" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\Reliability" /v SqmLoggerRunning /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v DisableOptinExperience /t REG_DWORD /d 1 /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v DiagTrackAuthorization /t REG_DWORD /d 0 /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags" /v UpgradeEligible /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser" /v HaveUploadedForTarget /t REG_DWORD /d 1 /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v DontRetryOnError /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v IsCensusDisabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v TaskEnableRun /t REG_DWORD /d 1 /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\TelemetryController" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\Diagtrack-Listener" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v Start /t REG_DWORD /d 0 /f

::relativo ao defender
powershell.exe -NoLogo -command "&{Set-MpPreference -MAPSReporting Disabled}"
powershell.exe -NoLogo -command "&{Set-MpPreference -SubmitSamplesConsent Never}"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingOverrideSpynetReporting /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v RealTimeSignatureDelivery /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v SignatureDisableNotification /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f

echo mudando opcoes visuais do Windows
::mudando para 1)melhor aparencia 2)melhor desempenho 3)personalizado
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f
::removendo animações e sombras (por: llbranco)
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9c12038010000000 /f
reg add "HKU\.DEFAULT\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9c12038010000000 /f
reg add "HKCU\SYSTEM\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_DWORD /d 0 /f
reg add "HKU\.DEFAULT\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_DWORD /d 0 /f

ping 127.0.0.1 -n 5 >nul 2>&1
title  %versao% -- Instalando util -- By: llbranco
echo instalando dotnet 3.5, 3 e 2
Dism /online /Enable-Feature /FeatureName:"NetFx3"

echo removendo onedrive padrao do Windows
set x86="%SystemRoot%\System32\OneDriveSetup.exe"
set x64="%SystemRoot%\SysWOW64\OneDriveSetup.exe"

taskkill /f /im OneDrive.exe >nul 2>&1
ping 127.0.0.1 -n 5 >nul 2>&1
if exist %x64% (
  %x64% /uninstall
) else (
  %x86% /uninstall
)

for %%a in (
Copilot
Cortana
Skype
"OneNote for Windows 10"
"Outlook for Windows"
"Microsoft Update Health Tools"
"Microsoft Bing"
"MSN Clima"
"Obter Ajuda"
"Pessoas Microsoft"
"Hub de Comentarios"
"*Microsoft.BingNews*"
"*Microsoft.GetHelp*"
"*Microsoft.Getstarted*"
"*Microsoft.Messaging*"
"*Microsoft.Microsoft3DViewer*"
"*Microsoft.MicrosoftOfficeHub*"
"*Microsoft.Office.Sway*"
"*Microsoft.OneConnect*"
"*Microsoft.People*"
"*Microsoft.Print3D*"
"*Microsoft.SkypeApp*"
"*microsoft.windowscommunicationsapps*"
"*Microsoft.WindowsFeedbackHub*"
"*Microsoft.ZuneMusic*"
"*Microsoft.ZuneVideo*"
) do (
title  %versao% -- Desinstalando %%a -- By: llbranco
echo desinstalando %%a
::winget install -e --id %%a --verbose
powershell.exe -NoLogo -Command "&{winget uninstall --name %%a --silent --all-versions}"
powershell.exe -NoLogo -Command "&{Get-AppxPackage -Name %%a | Remove-AppxPackage -ErrorAction SilentlyContinue}"
powershell.exe -NoLogo -Command "&{Get-AppxPackage -Name %%a -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue}"
powershell.exe -NoLogo -Command "&{Get-AppxPackage -Name '%%a' | Remove-AppxPackage -ErrorAction SilentlyContinue}"
powershell.exe -NoLogo -Command "&{Get-AppxPackage -Name '%%a' -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue}"
)

title  %versao% -- Desinstalando bloatwares -- By: llbranco
for %%a in (
9WZDNCRD29V9
9NG1H8B3ZC7M
MSIX\Microsoft.Getstarted_10.2312.1.0_x64__8wekyb3d8bbwe
9NZBF4GT040C
9WZDNCRFJ3Q2
MSIX\Microsoft.Microsoft3DViewer_7.2502.5012.0
XPFFZHVGQWWLHB
9NBLGGH42THS
9NRX63209R7B
9NBLGGH10PG8
9NBLGGH4R32N
9NBLGGH42THS
9WZDNCRFHVQM
9PM860492SZD
9NBLGGH67NCL
9NCBCSZSJRSB
9PKDZBMV1H3T
9WZDNCRDTBVB
9WZDNCRFHVJL
9P8LBDM4FW35
) do (
echo desinstalando bloatware
powershell.exe -NoLogo -Command "&{winget uninstall --id %%a --silent --all-versions}"
)

echo removendo aplicativos sugeridos
powershell.exe -NoLogo -Command "&{Get-AppxPackage LinkedIn | Remove-AppxPackage}"
powershell.exe -NoLogo -Command "&{Get-AppxPackage -allusers LinkedIn | Remove-AppxPackage}"
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "7EE7776C.LinkedInforWindows_w1wdnht996qgy" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Clipchamp.Clipchamp_yxz26nhyzhsrt" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.Todos_8wekyb3d8bbwe" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.ZuneVideo_8wekyb3d8bbwe" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "SpotifyAB.SpotifyMusic_zpdnekdrzrea0" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /f

echo desinstalando powershell 7 preview
powershell.exe -NoLogo -Command "&{winget uninstall "Microsoft.PowerShell.Preview" --silent --all-versions}"
if %errorlevel% equ 0 (
    echo PowerShell 7 Preview desinstalado com sucesso.
) else (
    echo Erro ao desinstalar PowerShell 7 Preview.
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
"%programfiles%\WinRAR\rar" x %office%
start "" %officetmp%
goto :eof

:avast_wg
echo instalando o avast
powershell.exe -NoLogo -Command "&{winget install -e --id XPDNZJFNCR1B07 --verbose --force --include-unknown --accept-package-agreements --accept-source-agreements}"
::echo importando configuracao do avast
::start "" avast.avastconfig
goto :eof

:avast_choco
echo instalando o avast
choco install avastfreeantivirus
::echo importando configuracao do avast
::start "" avast.avastconfig
goto :eof

:opx
Set kbnum=
echo desinstalador de atualizacao
echo.
echo atualizacoes problematicas ja serao removidas automaticamente
echo.
echo digite o codigo da atualizacao sem o KB
echo para desinstalar KB5063878 digite apenas 5063878
echo.
	Set /P kbnum=	qual update deseja remover: 
echo.
echo desinstalando a atualizacao kb%kbnum%
wusa /uninstall /kb:5063878 /quiet /norestart
wusa /uninstall /kb:%kbnum% /quiet /norestart
echo.
pause
goto payload
