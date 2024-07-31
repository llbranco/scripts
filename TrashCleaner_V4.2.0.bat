@echo off & @%SystemDrive% & @prompt & @color 17
::permitindo acentuação
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul

:: elevando batch para adm
:: não edite essa parte
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cls

::::::::::::::::::::VARIAVEIS DE CAMINHOS MUITO USADOS
:: %appdata% = AppData\Roaming
:: %localappdata% = AppData\Local
:: %userprofile% / %HomePath% = c:\users\usuario
SET Admin1=%SystemDrive%\Documents and Settings\Administrador
SET Admin2=%SystemDrive%\Documents and Settings\Administrator
SET dados1=Dados de aplicativos
SET dados2=Application Data
SET config1=CONFIG~1
SET config2=Local Settings
SET delay=ping -n 3  0.0.0.0 > nul&cls
goto var

:menu
title %newtitle%
set opcao=
cls&ver
echo ===============================================================================
echo ..%NewTitle%..
echo ===============================================================================
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                 Projeto de Luciano Branco iniciado em 05/02/2009
echo           https://github.com/llbranco          Petropolis - RJ - Brasil
echo ===============================================================================
echo.
echo                               Selecione uma Opção
echo.
echo ===============================================================================
echo	 1  - Temporários e Histórico de Navegadores (+ java e flash)
echo	 2  - Temporários do Windows, winrar, caches, logs
echo	 3  - Arquivos temporarios do MSN e Skype
echo	 4  - Restauração do Sistema ( System Volume Information )
echo	 5  - Executar todos os módulos (Em caso de dúvida use essa opção)
echo	 6  - Sobre
echo	 7  - Submenu
echo	 8  - Exibir arquivos ocultos (requer reinicio)(so usar em caso de vírus)
echo ===============================================================================
echo.
	Set /P opcao=	Tecle a opção desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
 If %opcao% equ 0 goto fim
 goto op%opcao%
goto fim

:op1
title %newtitle% - Limpeza de Navegadores
::opção 1 do menu
::limpa arquivos de navegadores, ie, firefox, chrome
::limpa cache do java e flash
@color 47
msg /time:15 * ATENÇÃO, o TrashCleaner %vVersao% vai finalizar seus navegadores abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ==================================== ATENÇÃO ==================================
echo        Para a segurança salve qualquer documento que esteja trabalhando
echo.
echo        Caso não esteja trabalhando em nenhum documento ou já tenha salvo
echo                     Pressione qualquer tecla para continuar
echo ===============================================================================
echo.
pause > nul
@color 17

:op1a
If %vFlag%==1 title %newtitle%   -   Etapa 1/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando Navegadores
for %%a in (
iexplore.exe
iexplorer.exe
chrome.exe
chromium.exe
firefox.exe
brave.exe
edge.exe
opera.exe
) do (@taskkill /f /im "%%a")

echo Finalizando AMBIENTE DE TRABALHO (explorer.exe)
@taskkill /f /im "explorer.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
%delay%

echo ::::::::Limpeza dos arquivos de Histórico do Internet explorer:::::::::::::

for %%a in (
"%Admin1%\%config1%\Hist*\*.*"
"%Admin2%\%config1%\Hist*\*.*"
"%HomePath%\%config1%\Hist*\*.*"
"%userprofile%\%config1%\Hist*\History.IE5\index.dat"
"%userprofile%\%config1%\Hist*"
"%Admin2%\%config2%\Hist*\*.*"
"%HomePath%\%config2%\Hist*\*.*"
"%userprofile%\%config2%\Hist*\History.IE5\index.dat"
"%userprofile%\%config2%\Hist*"
"%localappdata%\Hist*\*.*"
"%appdata%\Hist*\History.IE5\index.dat"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
Rmdir /s/q %%a
)
%delay%

echo :::::::::::::::::::::Limpeza de arquivos de Cookies do IE::::::::::::::::::
for %%a in (
"%Admin1%\Cookies\*.*"
"%Admin2%\Cookies\*.*"
"%HomePath%\Cookies\*.*"
"%userprofile%\Cookies"
"%userprofile%\Cookies\index.dat"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
Rmdir /s/q %%a
)
%delay%

echo ::::::::::Limpeza dos arquivos Temporarios do Internet explorer::::::::::::
for %%a in (
"%Admin1%\%config1%\Temporary Internet Files\*.*"
"%Admin1%\%config1%\Temporary Internet Files\Content.IE5\*.*"
"%Admin1%\%config1%\Temporary Internet Files"
"%Admin2%\%config1%\Temporary Internet Files\*.*"
"%Admin2%\%config1%\Temporary Internet Files\Content.IE5\*.*"
"%Admin2%\%config1%\Temporary Internet Files"
"%SystemDrive%\Documents and Settings\NetworkService\%config1%\Temporary Internet Files\*.*"
"%SystemDrive%\Documents and Settings\NetworkService\%config1%\Temporary Internet Files\*.*"
"%SystemDrive%\Documents and Settings\LocalService\%config1%\Temporary Internet Files\*.*"
"%SystemDrive%\Documents and Settings\LocalService\%config1%\Temporary Internet Files\*.*"
"%SystemDrive%\Documents and Settings\NetworkService\%config2%\Temporary Internet Files\*.*"
"%SystemDrive%\Documents and Settings\NetworkService\%config2%\Temporary Internet Files\*.*"
"%SystemDrive%\Documents and Settings\LocalService\%config2%\Temporary Internet Files\*.*"
"%SystemDrive%\Documents and Settings\LocalService\%config2%\Temporary Internet Files\*.*"
"%HomePath%\%config1%\Temporary Internet Files\*.*"
"%HomePath%\%config1%\Temporary Internet Files\"
"%HomePath%\%config2%\Temporary Internet Files\*.*"
"%HomePath%\%config2%\Temporary Internet Files\"
"%userprofile%\%config1%\Temporary Internet Files"
"%userprofile%\%config1%\Temporary Internet Files"
"%userprofile%\%config1%\Temporary Internet Files"
"%userprofile%\%config1%\Temporary Internet Files\Content.IE5\index.dat"
"%userprofile%\%config2%\Temporary Internet Files"
"%userprofile%\%config2%\Temporary Internet Files"
"%userprofile%\%config2%\Temporary Internet Files"
"%userprofile%\%config2%\Temporary Internet Files\Content.IE5\index.dat"
"%HomePath%\IECompatCache\*.*"
"%HomePath%\IETldCache\*.*"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
Rmdir /s/q %%a
)
%delay%

if not exist	"%programfiles%\ie7\iexplore.exe" goto verificaie8
goto ie7verificado 

:verificaie8
if not exist	"%programfiles%\ie8\iexplore.exe" goto firefox
goto ie7verificado

:ie7verificado
echo ::::::::::::::::::::::::EXECUTANDO LIMPEZA ADICIONAL:::::::::::::::::::::::
echo limpando Temporary Internet Files&RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo limpando Cookies&RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
echo limpando Historico&RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
echo limpando Dados de Formulario&RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
echo limpando Senhas Salvas&RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
echo limpando arquivos e configuracoes salvas por addons&RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
echo Executando limpeza final do Internet Explorer&RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
%delay%

:firefox
echo :::::::::::::::::::::::EXECUTANDO LIMPEZA DO FIREFOX::::::::::::::::::::::
if not exist "%programfiles%\MOZILLA\firefox.exe" echo FIREFOX não insalado&goto chrome
echo Excluindo arquivos tempor?rios do Mozilla Firefox
for %%a in (
cd "%localappdata%\Mozilla\Firefox\Profiles"
cd "%appdata%\Mozilla\Firefox\Profiles"
) do (
del /f /q /s "*.sqlite"
)
%delay%

:chrome
echo :::::::::::::::::::::::EXECUTANDO LIMPEZA DO CHROME:::::::::::::::::::::::
%SystemDrive%&cd \
for %%a in (
"%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\History"
"%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Cookies"
"%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Current Session"
"%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Archived History"
"%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Visited Links"
"%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Cache\*.*"
"%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Media Cache\*.*"

"%localappdata%\Google\Chrome\User Data\Default\History"
"%localappdata%\Google\Chrome\User Data\Default\Cookies"
"%localappdata%\Google\Chrome\User Data\Default\Current Session"
"%localappdata%\Google\Chrome\User Data\Default\Archived History"
"%localappdata%\Google\Chrome\User Data\Default\Visited Links"
"%localappdata%\Google\Chrome\User Data\Default\Cache\*.*"
"%localappdata%\Google\Chrome\User Data\Default\Media Cache\*.*"

"%appdata%\Google\Chrome\User Data\Default\History"
"%appdata%\Google\Chrome\User Data\Default\Cookies"
"%appdata%\Google\Chrome\User Data\Default\Current Session"
"%appdata%\Google\Chrome\User Data\Default\Archived History"
"%appdata%\Google\Chrome\User Data\Default\Visited Links"
"%appdata%\Google\Chrome\User Data\Default\Cache\*.*"
"%appdata%\Google\Chrome\User Data\Default\Media Cache\*.*"

"%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\History"
"%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Cookies"
"%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Current Session"
"%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Archived History"
"%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Visited Links"
"%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Cache\*.*
"%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Media Cache\*.*"

"%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\History"
"%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Cookies"
"%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Current Session"
"%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Archived History"
"%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Visited Links"
"%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Cache\*.*
"%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Media Cache\*.*"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
)
%delay%

:edge
for %%a in (
"%HomePath%\%config1%\%dados1%\*"
"%localappdata%\Microsoft\Edge\User Data\Default\Cache\*
"%localappdata%\Microsoft\Windows\WebCache\WebCacheV01.dat"
"%localappdata%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\#!001\Cache\*"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
)
%delay%


:java_flash
echo ::::::::::::::::::::EXECUTANDO LIMPEZA DO FLASH E JAVA::::::::::::::::::::
for %%a in (
"%HomePath%\%dados1%\Sun\Java\Deployment\cache\*.*"
"%HomePath%\%dados2%\Sun\Java\Deployment\cache\*.*"
"%HomePath%\%dados1%\Sun\Java\Deployment\log\*.*"
"%HomePath%\%dados2%\Sun\Java\Deployment\log\*.*"
"%HomePath%\%dados1%\Sun\Java\Deployment\SystemCache\*.*"
"%HomePath%\%dados2%\Sun\Java\Deployment\SystemCache\*.*"
"%HomePath%\%dados1%\Macromedia\Flash Player\#SharedObjects\*.*"
"%HomePath%\%dados2%\Macromedia\Flash Player\#SharedObjects\*.*"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
)
%delay%

echo :::::::::::::::LIMPEZA DE NAVEGADORES FINALIZADA COM SUCESSO::::::::::::::
start explorer
%delay%

::flag reservada para que a opção "TODOS OS MÓDULOS FUNCIONE"
If %vFlag%==1 goto op2a
goto menu

:op2
title %newtitle% - Limpeza do Sistema
::opção 2 do menu
::limpa lixeira, arquivos temporários do windows
::limpa prefetch, caches, logs, winrar
::limpa temporarios de alguns antivirus
::limpa algumas MRUs
@color 47
msg /time:15 * ATENÇÃO, o TrashCleaner %vVersao% vai finalizar programas abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ==================================== ATENÇÃO ==================================
echo        Para a segurança salve qualquer documento que esteja trabalhando
echo.
echo        Caso não esteja trabalhando em nenhum documento ou já tenha salvo
echo                     Pressione qualquer tecla para continuar
echo ===============================================================================
echo.
pause > nul
@color 17

:op2a
If %vFlag%==1 title %newtitle%   -   Etapa 2/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando AMBIENTE DE TRABALHO (explorer.exe)
@taskkill /f /im "explorer.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
%delay%

echo ::::::::::LIMPEZA DOS ARQUIVOS TEMPORARIOS DO MICROSOFT WINDOWS::::::::::::
SFC /Purgecache
FOR /L %%d IN (9,1,100) DO (
del /f/s/q		"%ALLUSERSPROFILE%\%dados1%\avg%%d\Log\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados1%\Kaspersky Lab\AVP%%d\Data\*.*
)

for %%a in (
"%HomeDrive%\.DS_Store"
".DS_Store"
"%SystemDrive%\RECYCLER\*.*"
"%HomeDrive%\RECYCLER\*.*"
"%TEMP%\*.*"
"%HomePath%\%config1%\Temp\*.*"
"%HomePath%\%config2%\Temp\*.*"
"%SystemDrive%\Temp\*.*"
"%HomePath%\Temp\*.*"
"%Admin1%\%config1%\Temp\*.*"
"%Admin1%\%config1%\Temp"
"%Admin2%\%config2%\Temp\*.*"
"%Admin2%\%config2%\Temp"
"%Systemroot%\system32\config\systemprofile\%config1%\Temp\*.*"
"%Systemroot%\system32\config\systemprofile\%config2%\Temp\*.*"
"%temp%"
"%tmp%"
"%HomePath%\Recent\*.*"
"%SystemDrive%\*.tmp"
"%SystemDrive%\*.temp"
"%SystemRoot%\*.tmp"

"%HomePath%\%config1%\%dados1%\Microsoft\Media Player\Transcoded Files Cache\*.*"
"%HomePath%\%config1%\%dados2%\Microsoft\Media Player\Transcoded Files Cache\*.*"
"%HomePath%\%config2%\%dados2%\Microsoft\Media Player\Transcoded Files Cache\*.*"

"%Systemroot%\Prefetch\*.*"
"%SystemRoot%\Prefetch"

"%SystemDrive%\*.DMP"
"%Systemroot%\*.dmp"
"%Systemroot%\minidump\*.*"
"%SystemRoot%\Minidump"

"%Systemroot%\System32\wbem\Logs\*.*"
"%Systemroot%\*.log"
"%SystemDrive%\*.log"
"%HomeDrive%\*.log"
"%ALLUSERSPROFILE%\%dados2%\Microsoft\WLSetup\Logs\*.*"
"%SystemDrive%\spoolerlogs"

"%SystemDrive%\*.sqm"
"%HomeDrive%\*.sqm"
"C:\*.sqm"
"D:\*.sqm"
"%SystemDrive%\sqmnoopt*.sqm
"%HomeDrive%\sqmnoopt*.sqm

"%ALLUSERSPROFILE%\%dados1%\Microsoft\Dr Watson\*.*"
"%ALLUSERSPROFILE%\%dados2%\Microsoft\Dr Watson\*.*"

"%SystemDrive%\qoobox\*.*"
"%SystemDrive%\qoobox\"

"%SYSTEMROOT%\system32\LogFiles"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
Rmdir /s/q %%a
)


::Removendo todos os arquivos com extenções x dentro da unidade do sistema
FOR %%d IN (tmp,sqm,log,temp,DS_Store) DO (
forfiles /p %SYSTEMROOT% /s /m *.%%d /d -1 /c "cmd /c del @file"
)

for %%a in (
"%SystemDrive%\$AV_ASW"
"%SystemDrive%\$WINDOWS.~BT"
"%SystemDrive%\$Windows.~WS"
"%SystemDrive%\PerfLogs"
"%SystemDrive%\Temp"
"%SystemDrive%\$Recycle.Bin"
) do (
del /f/s/q %%a
del /q/s/a:r %%a
del /q/s/a:a %%a
del /q/s/a:h %%a
Rmdir /s/q %%a
)


reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f /va
@echo off
@echo Windows Registry Editor Version 5.00>%TEMP%\01.reg
@echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU]>>%TEMP%\01.reg
@echo "MRUList"="vjkuctsrbgqponmlihefda">>%TEMP%\01.reg
regedit /s %TEMP%\01.reg

reg delete HKCU\Software\WinRAR\ArcHistory /f /va
@echo off
@echo Windows Registry Editor Version 5.00>%TEMP%\03.reg
@echo [HKEY_CURRENT_USER\Software\WinRAR\ArcHistory]>>%TEMP%\03.reg
@echo "1"="">>%TEMP%\03.reg
@echo "2"="">>%TEMP%\03.reg
@echo "3"="">>%TEMP%\03.reg
@echo "4"="">>%TEMP%\03.reg
regedit /s %TEMP%\03.reg
cls

reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /t REG_SZ /d "http://naoquerousarwindowsupdate.com:9999" /f
echo.
echo proibindo que o usuario re-ative o Windows-Update
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /t REG_DWORD /d 0 /f

echo :::::::::::LIMPEZA DE TEMPORÁRIOS DO MICROSOFT WINDOWS TERMINADA::::::::::
start explorer
%delay%

::flag reservada para que a opção "TODOS OS MODULOS" FUNCIONE
If %vFlag%==1 goto op3a
goto menu

:op3
title %newtitle% - Limpeza do MSN e Skype
::opção 3 do menu
::limpa arquivos temporios do msn
::limpa cache de inslata??o e login salvo
@color 47
msg /time:15 * ATENÇÃO, o TrashCleaner %vVersao% vai fechar seu msn e skype aberto, tenha certeza de ter finalizado suas conversas antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ==================================== ATENÇÃO ==================================
echo        Para a segurança salve qualquer documento que esteja trabalhando
echo.
echo        Caso não esteja trabalhando em nenhum documento ou já tenha salvo
echo                     Pressione qualquer tecla para continuar
echo ===============================================================================
echo.
pause > nul
@color 17

:op3a
If %vFlag%==1 title %newtitle%   -   Etapa 3/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando MSN
@taskkill /f /im "msnmsgr.exe"
@taskkill /f /im "skype.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
%delay%

del /f/s/q "%ALLUSERSPROFILE%\%dados1%\Skype\Plugins\Local Cache\*.*"
del /f/s/q "%ALLUSERSPROFILE%\%dados1%\Microsoft\WLSetup\Logs\*.*"
del /f/s/q "%ALLUSERSPROFILE%\%dados2%\Skype\Plugins\Local Cache\*.*"
del /f/s/q "%ALLUSERSPROFILE%\%dados2%\Microsoft\WLSetup\Logs\*.*"

Del /f/s/q "%HomePath%\%config1%\%dados1%\Microsoft\Messenger\*.*"
Del /f/s/q "%HomePath%\%config1%\%dados2%\Microsoft\Messenger\*.*"
rmdir /s/q "%HomePath%\%config1%\%dados1%\Microsoft\Messenger\"
rmdir /s/q "%HomePath%\%config1%\%dados2%\Microsoft\Messenger\"
Del /f/s/q "%HomePath%\%config2%\%dados2%\Microsoft\Messenger\*.*"
rmdir /s/q "%HomePath%\%config2%\%dados2%\Microsoft\Messenger\"

Del /f/s/q "%USERPROFILE%\%config1%\%dados1%\Microsoft\Windows Live Contacts\*.*"
Del /f/s/q "%USERPROFILE%\%config1%\%dados2%\Microsoft\Windows Live Contacts\*.*"
Del /f/s/q "%USERPROFILE%\%config2%\%dados2%\Microsoft\Windows Live Contacts\*.*"
Del /f/s/q "%HomePath%\%config1%\%dados1%\Microsoft\Windows Live Contacts\*.*"
RmDir /s/q "%HomePath%\%config1%\%dados1%\Microsoft\Windows Live Contacts\"
Del /f/s/q "%HomePath%\%config1%\%dados2%\Microsoft\Windows Live Contacts\*.*"
rmdir /s/q "%HomePath%\%config1%\%dados2%\Microsoft\Windows Live Contacts\"
Del /f/s/q "%HomePath%\%config2%\%dados2%\Microsoft\Windows Live Contacts\*.*"
rmdir /s/q "%HomePath%\%config2%\%dados2%\Microsoft\Windows Live Contacts\"

Del /f/s/q "%HomePath%\%config1%\%dados1%\Microsoft\Windows Live\*.*"
RmDir /s/q "%HomePath%\%config1%\%dados1%\Microsoft\Windows Live"
Del /f/s/q "%HomePath%\%config1%\%dados2%\Microsoft\Windows Live\*.*"
rmdir /s/q "%HomePath%\%config1%\%dados2%\Microsoft\Windows Live"
Del /f/s/q "%HomePath%\%config2%\%dados2%\Microsoft\Windows Live\*.*"
rmdir /s/q "%HomePath%\%config2%\%dados2%\Microsoft\Windows Live"

del /f/s/q		"%HomePath%\%dados1%\Microsoft\MSNLiveFav\*.*"
del /f/s/q		"%HomePath%\%dados2%\Microsoft\MSNLiveFav\*.*"

:: Del /f/s/q "%HomePath%\Contacts\*.*"
:: Del /f/s/q "%USERPROFILE%\Contacts"
:: rmdir /s/q "%HomePath%\Contacts\"

Del /f/s/q "%CommonProgramFiles%\Windows Live\.cache\*.*"
rmdir /s/q "%CommonProgramFiles%\Windows Live\.cache\"

Del /f/s/q "%USERPROFILE%\%dados1%\Microsoft\MSN Messenger\*.*"
rmdir /s/q "%USERPROFILE%\%dados1%\Microsoft\MSN Messenger\"
Del /f/s/q "%USERPROFILE%\%dados2%\Microsoft\MSN Messenger\*.*"
rmdir /s/q "%USERPROFILE%\%dados2%\Microsoft\MSN Messenger\" 

Del /f/s/q "%USERPROFILE%\%dados1%\Microsoft\IdentityCRL\*.*"
Del /f/s/q "%ALLUSERSPROFILE%\%dados1%\Microsoft\IdentityCRL\*.*"
Del /f/s/q "%USERPROFILE%\%dados2%\Microsoft\IdentityCRL\*.*"
Del /f/s/q "%ALLUSERSPROFILE%\%dados2%\Microsoft\IdentityCRL\*.*"

reg delete "HKEY_CURRENT_USER\Software\Microsoft\MSNMessenger\PerPassportSettings" /f
reg delete HKCU\Software\Microsoft\IdentityCRL\Creds /f /va
@echo off
@echo Windows Registry Editor Version 5.00>%TEMP%\02.reg
@echo [HKEY_CURRENT_USER\Software\Microsoft\IdentityCRL\Creds]>>%TEMP%\02.reg
regedit /s %TEMP%\02.reg

::flag reservada para que a opção "TODOS OS MODULOS FUNCIONE"
If %vFlag%==1 goto op4a
goto menu


:op4
title %newtitle% - Limpeza Restauracao do sistema
::opção 4 do menu
::limpa arquivos de recuperação do windows (limpa a pasta SYSTEM VOLUME INFORMATION)
::muitas vezes virus acabam infectando essa pasta e NORMALMENTE anti-virus não conseguem escanea-la
@color 47
msg /time:15 * ATENÇÃO, o TrashCleaner %vVersao% vai finalizar programas abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ==================================== ATENÇÃO ==================================
echo        Para a segurança salve qualquer documento que esteja trabalhando
echo.
echo        Caso não esteja trabalhando em nenhum documento ou já tenha salvo
echo                     Pressione qualquer tecla para continuar
echo ===============================================================================
echo.
pause > nul
@color 17

:op4a
If %vFlag%==1 title %newtitle%   -   Etapa 4/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando AMBIENTE DE TRABALHO (explorer.exe)
@taskkill /f /im "explorer.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
%delay%

CACLS "%SystemDrive%\System Volume Information" /T /E /G %UserName%:F
Del    /F /S /Q          "%SystemDrive%\System Volume Information\*.*"
RmDir     /S /Q          "%SystemDrive%\System Volume Information"

FOR %%z IN (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) DO (
CACLS "%%z:\System Volume Information" /T /E /G %UserName%:F
Del    /F /S /Q          "%%z:\System Volume Information\*.*"
RmDir     /S /Q          "%%z:\System Volume Information"
)

start explorer
Set vFlag=0
goto menu

:op5
title %newtitle% - Limpeza completa
::opção 5 do menu
::executa todas as opções anteriores
Set vFlag=1
@color 47
msg /time:15 * ATENÇÃO, o TrashCleaner %vVersao% vai finalizar varios programas abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ==================================== ATENÇÃO ==================================
echo        Para a segurança salve qualquer documento que esteja trabalhando
echo.
echo        Caso não esteja trabalhando em nenhum documento ou já tenha salvo
echo                     Pressione qualquer tecla para continuar
echo ===============================================================================
echo.
pause > nul
@color 17
goto op1a

:op6
title %NewTitle% - Sobre
echo =================================== Sobre =====================================
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugestões ou criticas: https://github.com/llbranco
echo ===============================================================================
echo Versao Reescrita incluindo alguns algoritmos e caminhos do Script:
echo    LIMPEZA (2009) escrito por BOSS HEAD (http://batch-satti.forumeiros.com)
echo.
echo Agradecimento especiais:
echo Domingos Baiocchi / Boss Head
echo.
echo corrigidos alguns bugs quando executado em windows em inglês (incluindo XP-64)
echo Adicionados alguns novos caminhos temporarios
echo ===============================================================================
pause >nul
cls
echo.
echo.
echo.
echo Trash Cleaner de Luciano Branco e licenciado sob uma Licenca Creative Commons
echo Atribuicaoo-Uso não-comercial-Compartilhamento pela mesma licenca 3.0 Unported.
echo https://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os creditos
echo ao criador (Luciano Branco / compact /u /s /a " )
echo.
echo caso modifique o codigo so podera distribui-lo utilizando a mesma licenca
echo gratuita e tambem permitindo modificacao ao SEU codigo!!!
echo.
echo Permissoes alem do escopo dessa licenca podem estar disponiveis em
echo https://github.com/llbranco
echo.
echo.
	Set /P licenca=	Tecle 1 depos [ENTER] para ver a licenca ou apenas [ENTER] para fechar: 
	Cls
	If %licenca% equ 1 start "" https://creativecommons.org/licenses/by-nc-sa/3.0
goto menu


:op7
set subm=
title %newtitle% - Sub-Menu
cls
echo ===================================SUB-MENU====================================
echo ..%NewTitle%..
echo ===============================================================================
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugestoes ou criticas: https://github.com/llbranco
echo ===============================================================================
echo.
echo                               Selecione uma opção
echo.
echo ===============================================================================
echo		 1  - Visualizar e Finalizar processos
echo		 2  - Iniciar/Reiniciar Processo "EXPLORER.EXE" (AMBIENTE DE TRABALHO)
echo		 3  - Iniciar processo
echo		 4  - Resetar permissões/Restricoes
echo =============================== OPERACOES DE IP ===============================
echo		5 - Renovar Endereco IP (v4 e v6)
echo		6 - Cofigurar para DHCP (ip automatico)
echo		7 - Salvar configuracao em  "%homedrive%\IPconfig.txt" 
echo		8 - Restaurar configuracao de "%homedrive%\IPconfig.txt"
echo		9 - Backup ("%homedrive%\IPconfig.txt") + DHCP
echo		0 - Voltar ao menu anterior
echo ===============================================================================
echo.
	Set /P subm=	Tecle a opção desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %subm% equ 0 goto menu
	If %subm% equ 1 goto 71processos
	If %subm% equ 2 taskkill /f /im "explorer.exe"&start explorer&GoTo 7submenu
	If %subm% equ 3 goto 73novo_processo
	If %subm% equ 4 goto 74permissões

	If %subm% equ 5 goto renovarip
	If %subm% equ 6 goto dhcp
	If %subm% equ 7 goto salvarip
	If %subm% equ 8 goto restauraip
	If %subm% equ 9 goto bkpdhcp
	If %subm% equ 10 goto 
goto fim

:71processos
cls
tasklist
echo.
echo Deseja Finalizar algum Processo?
set /p programa=Digite o nome do processo para finalisar:
echo.
echo Digite 2 Para volta ao Sub-Menu
if %programa% == 2 goto 7submenu
taskkill /f /im %programa%
echo Pressione qualquer tecla para continuar
pause >nul
cls
goto 7submenu

:73novo_processo
cls
set /p task=nome de proceso:%task%
start %task%
goto 7submenu

:74permissões
echo Digite 0 Para volta ao menu
set /p drive=Por Favor entre com a letra da unidade:
if %drive% == 0 goto Inicio
cls
echo Esta opção vai reiniciar TODAS as permissões para TODOS os usuarios
echo todas as pastas e SUBPASTAS da unidade %drive% vao ter as permissões alteradas
echo ---
echo Resetando permissões da unidade _"%drive%:"_
echo ---
CACLS %drive% /T /C /G todos:F
cls
echo Resetando atributos (oculto somente leitura e sistema)
set /p YN=Deseja Realemente resetar atributos da unidade "%drive%:"? (S N)
if %YN% == N GoTo Inicio
if %YN% == n GoTo Inicio
pause > nul
ATTRIB -S -H -R %drive% /S /D
goto 7submenu

:75ip
:renovarip
ipconfig /flushdns
ipconfig /renew
ipconfig /renew6
ipconfig /release
ipconfig /release6
ipconfig /all
ipconfig /registerdns
goto 7submenu

:salvarip
netsh -c interface dump > "%homedrive%\IPconfig.txt"
start "" notepad "%homedrive%\IPconfig.txt"
pause
goto 7submenu

:restauraip
netsh -f "%homedrive%\IPconfig.txt"
pause
goto 7submenu

:dhcp
netsh interface ip set address "Local Area Connection" dhcp
netsh interface ip set address "conexão local" dhcp
netsh interface ip set address "conexão local 2" dhcp
netsh interface ip set address "Local Area Connection 2" dhcp

netsh interface ip set dns "Local Area Connection" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip set dns "conexão local" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip set dns "conexão local 2" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip set dns "Local Area Connection 2" source=static addr=8.8.8.8 register=PRIMARY
goto 7submenu

:bkpdhcp
netsh -c interface dump > "%homedrive%\IPconfig.txt"
netsh interface ip set address "Local Area Connection" dhcp
netsh interface ip set address "conexão local" dhcp
netsh interface ip set address "conexão local 2" dhcp
netsh interface ip set address "Local Area Connection 2" dhcp

netsh interface ip set address dns "Local Area Connection" static 8.8.8.8
netsh interface ip set address dns "conexão local" static 8.8.8.8
netsh interface ip set address dns "conexão local 2" static 8.8.8.8
netsh interface ip set address dns "Local Area Connection 2" static 8.8.8.8

ipconfig /flushdns
ipconfig /renew
ipconfig /renew6
ipconfig /release
ipconfig /release6
ipconfig /all
ipconfig /registerdns
goto 7submenu

:op8
::usar apenas se não for possivel exibir arquivos ocultos de forma convencional
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL /v CheckedValue /t Reg_DWORD /d 0x1 /f
echo para esta opção ter efeito é necessario reiniciar o computador
goto menu

:bosshead
if,not,defined,.m_,set.m_=%*&if,not,defined,.m_,goto:eof
<nul,set/p.m_=%.m_:~0,1%&>nul,ping -n 1 0&set.m_=%.m_:~1%&if,defined,.m_ (goto:bosshead),else,(echo.)
goto:eof

:var
	set vCabeca=TrashCleaner! - Removedor de Arquivos Temporarios
	set vVersao=V4.2.0
	set vData=25/jul/2024
	set vRelease=%vVersao%    %vData%
	set NewTitle=%vCabeca%     %vRelease%
	set vFlag=0
	set vPath=%Path%;%CD%;%SystemDrive%;A:;B:;C:;D:;E:;F:G:;H:;I:;J:;K:;L:;M:;N:;O:;P:;Q:;R:;S:;T:;U:;V:;W:;X:;Y:;Z:
	set ok=_por cento concluido
	set opcao=
	
	rename "%~f0" "TrashCleaner_%vVersao%.bat"
	
goto menu

:fim
	echo on
	set vCabeca=
	set vVersao=
	set vData=
	set vRelease=
	set NewTitle=
	set vFlag=
	set vPath=
	set Title=
	set test=
	set subm=
	set opção=
del /f/s/q "%userprofile%\Trash Cleaner v410.bat"
exit
