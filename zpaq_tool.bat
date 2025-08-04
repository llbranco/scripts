@echo off
setlocal EnableDelayedExpansion
:: zpac_tool v0.1

:: Caminho do executável ZPAQ
set "ZPAQ=zpaq.exe"
set "ZPAQ_PATH=%~dp0%ZPAQ%"
set "OUTFOLDER=%~dpn1_extracted"

:: Baixar zpaq.exe se não estiver presente
if not exist "%ZPAQ_PATH%" (
    echo zpaq64.exe nao encontrado. Baixando...
    powershell -Command "try { Invoke-WebRequest -Uri 'http://mattmahoney.net/dc/zpaq.exe' -OutFile '%ZPAQ_PATH%' -UseBasicParsing } catch { exit 1 }"
    if exist "%ZPAQ_PATH%" (
        echo zpaq.exe baixado com sucesso!
    ) else (
        echo ERRO: Falha ao baixar zpaq.exe
        pause
        exit /b
    )
)

:: ===== Menu interativo =====
:menu
cls
echo ===============================
echo         ZPAQ TOOL
echo ===============================
echo 1 - Compactar arquivo ou pasta
echo 2 - Extrair arquivo .zpaq
echo 3 - compactar "%~1\*"
echo 4 - extrair "%~1"
echo ===============================
echo recomendado usar peazip para extrair os arquivos
echo 0 - Sair
echo ===============================

set /p opcao="Escolha uma opcao (0-4): "

if "%opcao%"=="1" (
    set /p TARGET="Digite o caminho do arquivo ou pasta a compactar: "
    if exist "%TARGET%" (
        %ZPAQ% add "arquivo.zpaq" "%TARGET%\*" -m5
    ) else (
        echo Caminho invalido.
        pause
    )
    goto menu
)

if "%opcao%"=="2" (
    set /p ARCHIVE="Digite o caminho do arquivo .zpaq a extrair: "
    if exist "%ARCHIVE%" (
        %ZPAQ% x "%ARCHIVE%" "%TARGET%"
    ) else (
        echo Arquivo invalido.
        pause
    )
    goto menu
)

if "%opcao%"=="3" (
    echo preparando para compactar "%~1\*"
	echo com o nome de arquivo.zpaq
	pause
    %ZPAQ% add "arquivo.zpaq" "%~1\*" -m5 -noattributes
    goto menu
)

if "%opcao%"=="4" (
set ARCHIVE="%~1"
echo Extraindo: "%~1" para "%OUTFOLDER%"...
pause
"%ZPAQ_PATH%" x "%~1" -to "%OUTFOLDER%"
pause
)
goto menu

if "%opcao%"=="0" (
    exit /b
)

echo Opcao invalida.
pause
goto menu

goto :eof