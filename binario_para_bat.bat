@echo off
title converte binario para batch
setlocal EnableDelayedExpansion

:: Verifica se foi passado um arquivo como argumento
if "%~1"=="" (
    echo Arraste um arquivo para este script .bat
    pause
    exit /b
)

:: Pega nome e extensões
set "input=%~1"
set "name=%~n1"
set "ext=%~x1"
set "output=%~dp0%name%.bat"
set "b64file=%TEMP%\%name%_b64.txt"
set "tempb64=%name%_data_b64.txt"

:: Converte o arquivo para base64
certutil -encode "%input%" "%b64file%" >nul

:: Começa a gerar o novo BAT com o conteúdo do arquivo embutido
(
    echo @echo off
    echo ^> "%%TEMP%%\%tempb64%" ^
( 
) > "%output%"

:: Escreve cada linha do base64 (inclui cabeçalhos automaticamente)
for /f "usebackq delims=" %%A in ("%b64file%") do (
    >> "%output%" echo echo %%A
)

:: Fecha o bloco e adiciona os comandos de reconstrução
(
    echo ^)
    echo certutil -decode "%%TEMP%%\%tempb64%" "%%~dp0%name%_out%ext%" ^>nul
    echo del "%%TEMP%%\%tempb64%"
    echo echo Arquivo reconstruido: %name%_out%ext%
    echo pause
) >> "%output%"

:: Remove temporário
del "%b64file%"
echo Script gerado com sucesso: %output%
pause
