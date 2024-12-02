@echo off
::https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/How-to-change-or-reset-licensing-on-your-Autodesk-software.html
::https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/How-to-reset-local-login-cache-for-Autodesk-desktop-software.html
if _%1_==_payload_  goto :payload

title resetar ativacao autocad
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
echo tentando executar o reset
echo.
cd /d %CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\
AdskLicensingInstHelper change -pk product_key -pv year.0.0.F -lm ""


echo parando servicos
for %%a in (
AdSSO.exe
AdAppMgrSvc.exe
AutodeskDesktopApp.exe
AdskLicensingAgent.exe
AdskLicensingService
ADPClientService.exe
AdskIdentityManager.exe
AccessCore.exe
AdskAccessUIHost.exe
"FlexNet Licensing Service"
FlexNet
FNPLicensingService.exe
) do (
echo encerrando e parando o servico %%a
sc stop %%a
taskkill /f /im %%a
sc config %%a start= disabled
echo.
)

echo aguarde...
ping 0.0.0.0 >nul

for %%a in (
AdSSO.exe
AdAppMgrSvc.exe
AutodeskDesktopApp.exe
AdskLicensingAgent.exe
ADPClientService.exe
AdskIdentityManager.exe
AccessCore.exe
AdskAccessUIHost.exe
"FlexNet Licensing Service"
FlexNet
FNPLicensingService.exe
) do (
echo reiniciando servico %%a
sc start %%a
sc config %%a start= auto
sc start %%a
)

echo.
::deletar o arquivo e as pastas
echo deletando arquivos e pastas da antiga licenca
echo.
echo deletando LGS.data
del /f/s/q "%programdata%\Autodesk\CLM\LGS\ProductKey_ProductVersion.0.0.F\LGS.data"
echo deletando programdata adut
Rmdir /s/q "%programdata%\Autodesk\ADUT"
echo deletando appdata adut
Rmdir /s/q "%appdata%\Autodesk\ADUT"
echo deletando loginstate.xml
del /f/s/q "%localappdata%\Autodesk\Web Services\LoginState.xml"
echo deletando idservices.db
del /f/s/q "%localappdata%\Autodesk\Identity Services\idservices.db"
echo renomeando fnp_registrations.xml
rename "C:\Program Files (x86)\Common Files\Macrovision Shared\FlexNet Publisher\fnp_registrations.xml" "fnp_registrations_old.xml"


echo renomeando edgewebview para evitar que o autocad detecte a licenca
echo acessando a pasta do EdgeWebView
cd /d "%programfiles(x86)%\Microsoft\EdgeWebView\Application"
echo caso der erro copie o bat para a pasta
echo "%programfiles(x86)%\Microsoft\EdgeWebView\Application"
echo e execute de la como administrador
:: %ProgramW6432%

for /r %%x in (msedgewebview2.exe) do ren "%%x" msedgewebview2.exe.bak


echo bloquear autocad via firewall
for /R %%f in (
"%programdata%\Autodesk"
"%CommonProgramFiles%\Autodesk Shared"
"%CommonProgramFiles(x86)%\Autodesk Shared"
"%localappdata%\Autodesk"
"%appdata%\Autodesk"
"%CommonProgramFiles(x86)%\Autodesk Shared\Network License Manager"
) do (
netsh advfirewall firewall add rule name="Blocked: %%f" dir=out program="%%f\*.exe" action=block
netsh advfirewall firewall add rule name="Blocked: %%f" dir=in program="%%f\*.exe" action=block

netsh advfirewall firewall add rule name="Blocked: %%f" dir=out program="%%f\*.dll" action=block
netsh advfirewall firewall add rule name="Blocked: %%f" dir=in program="%%f\*.dll" action=block
)

echo pastas para deletar caso esteja tendo problemas com a ativacao
echo "%programdata%\Autodesk"
echo "%CommonProgramFiles%\Autodesk Shared"
echo "%CommonProgramFiles(x86)%\Autodesk Shared"
echo "%localappdata%\Autodesk"
echo "%appdata%\Autodesk"

pause
:fim
exit
