@echo off
title limpeza de instalacao do autocad
:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

cls
echo esse script vai deletar todas as pastas referentes ao autocad
echo vc deve OBRIGATORIAMENTE DESINSTALAR todos os apps da autodesk
echo antes de prosseguir
echo.

pause
	Set /P opcao=	(1) para continuar: 
	Cls
	If %opcao% equ 1 goto continuar
goto fim

echo parando aplicativos e serviços
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

echo aguarde
ping 0.0.0.0>nul

for %%a in (
"%programdata%\Autodesk"
"%CommonProgramFiles%\Autodesk Shared"
"%CommonProgramFiles(x86)%\Autodesk Shared"
"%localappdata%\Autodesk"
"%appdata%\Autodesk"
) do (
echo deletando %%a
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
Rmdir /s/q %%a
echo.
)

pause

:fim
exit
goto:eof
