@echo off
setlocal enableextensions
cd /d "%~dp0"

echo copie esse batch para a pasta do aplicativo que queira bloquear
echo e depois execute para bloquear totalmente o acesso dele a internet (e rede)
echo.
echo para autocad colocar tbm na pasta
echo c:/Program Files(x86)/Common Files/Autodesk Shared/Network License Manager
pause
	Set /P opcao=	(1) para continuar: 
	Cls
	If %opcao% equ 1 goto continuar
goto fim

:continuar
for /R %%f in (
*.exe
*.dll
) do (
netsh advfirewall firewall add rule name="Blocked: %%f" dir=out program="%%f" action=block
netsh advfirewall firewall add rule name="Blocked: %%f" dir=in program="%%f" action=block
)
pause

:fim
exit