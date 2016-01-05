setlocal
set /p %drive= digite a unidade onde o windows esta instalado

dism.exe /image:%drive%:\ /cleanup-image /revertpendingactions

endlocal
