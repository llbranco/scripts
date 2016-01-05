@echo off
color a
title Destravador de impressora
%systemroot%
cd \
cls
echo Deletando arquivos pendentes...
net stop spooler
cd %systemroot%\system32\spool\PRINTERS
del /f /s *.SHD
del /f /s *.SPL
net start spooler
msg * Impressora Destravada!
exit
