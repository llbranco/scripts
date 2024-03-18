@echo off
@%SystemDrive%
@prompt
@color 17
title desinstalador de impressora
echo obtendo nome das impressoras instaladas

:inicio
set print=null
wmic printer get name

::desinstalar impressora
::printui.exe /dl /n "Your_Printer_Name"

echo desinstalar impressora
echo EXATAMENTE COMO DEMONSTRADO ACIMA
set /p print= impressora:
echo.
echo.
Cls
	
echo desinstalando a impressora "%print%"
	
echo exibindo info da impressora
echo 1 %
printui.exe /p /n "%print%"

pause
echo desinstalando impressora	
printui.exe /dl /n "%print%"

pause
goto inicio

:fim
echo algo deu errado
pause
goto:eof