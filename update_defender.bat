@echo off
echo ver 0.1

set msdefender="%programfiles%\Windows Defender\MpCmdRun.exe"
%msdefender% -removedefinitions -dynamicsignatures
%msdefender% -SignatureUpdate
