@echo off
echo ver 0.1

::force mode
::set msdefender="%programfiles%\Windows Defender\MpCmdRun.exe"
::%msdefender% -removedefinitions -dynamicsignatures
::%msdefender% -SignatureUpdate

:: powershell mode
powershell.exe -command "& {Update-MpSignature -Verbose; pause}"
