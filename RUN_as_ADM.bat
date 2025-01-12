@echo off
set __COMPAT_LAYER=RunAsInvoker
echo executar aplicativo como administrador sem ser administrador
echo.
Set /P app=Nome do executavel(ex: aplicativo.exe) e [ENTER]: 
Start %app%