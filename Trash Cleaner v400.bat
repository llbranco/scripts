@echo off
@%SystemDrive%
@prompt
@color 17
::::::::::::::::::::VARIAVEIS DE CAMINHOS MUITO USADOS
SET Admin1=%SystemDrive%\Documents and Settings\Administrador
SET Admin2=%SystemDrive%\Documents and Settings\Administrator
SET dados1=Dados de aplicativos
SET dados2=Application Data
SET config1=CONFIG~1
SET config2=Local Settings
goto var





:menu
title %newtitle%
set opcao=
cls&ver
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo ..%NewTitle%..
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                 Projeto de Luciano Branco iniciado em 05/02/2009
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo                               Selecione uma Opcao
echo.
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo	 1  - Temporarios e Historico de Navegadores (+ java e flash)
echo	 2  - Temporarios do Windows, winrar, caches, logs
echo	 3  - Arquivos temporarios do MSN e Skype
echo	 4  - Restauracao do Systema ( System Volume Information )
echo	 5  - Executar todos os modulos (Em caso de duvida use essa opcao)
echo	 6  - Sobre
echo	 7  - Submenu
echo	 8  - Exibir arquivos ocultos (requer reinicio)(so usar em caso de virus)
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
	Set /P opcao=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %opcao% equ 0 goto fim
	If %opcao% equ 1 goto 1browser
	If %opcao% equ 2 goto 2sys
	If %opcao% equ 3 goto 3msn
	If %opcao% equ 4 goto 4svi
	If %opcao% equ 5 goto 5tudo
	If %opcao% equ 6 goto 6sobre
	If %opcao% equ 7 goto 7submenu
	If %opcao% equ 8 goto 8oculto
goto fim

:1browser
title %newtitle% - Limpeza de Navegadores
::op็ใo 1 do menu
::limpa arquivos de navegadores, ie, firefox, chrome
::limpa cache do java e flash
@color 47
msg /time:15 * ATENวรO, o TrashCleaner %vVersao% vai finalizar seus navegadores abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ออออออออออออออออออออออออออออออออออออ ATENCAO ออออออออออออออออออออออออออออออออออ
echo        Para a seguranca salve qualquer documento que esteja trabalhando
echo.
echo        Caso nao esteja trabalhando em nenhum documento ou ja tenha salvo
echo                     Pressione qualquer tecla para continuar
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
pause > nul
@color 17

:1browser2
If %vFlag%==1 title %newtitle%   -   Etapa 1/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando Navegadores
@taskkill /f /im "iexplore.exe"
@taskkill /f /im "iexplorer.exe"
@taskkill /f /im "chrome.exe"
@taskkill /f /im "firefox.exe"
echo Finalizando AMBIENTE DE TRABALHO (explorer.exe)
@taskkill /f /im "explorer.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
ping -n 3  0.0.0.0 > nul&cls

echo ::::::::Limpeza dos arquivos de Hist๓rico do Internet explorer:::::::::::::
del /f/s/q		"%Admin1%\%config1%\Hist*\*.*"
del /f/s/q		"%HomePath%\%config1%\Hist*\*.*"
del /q/s/f		"%userprofile%\%config1%\Hist*\History.IE5\index.dat" > NUL
del /q/s/a:r	"%userprofile%\%config1%\Hist*"
del /q/s/a:a	"%userprofile%\%config1%\Hist*"
del /q/s/a:h	"%userprofile%\%config1%\Hist*"
Rmdir /s/q		"%userprofile%\%config1%\Hist*"

del /f/s/q		"%Admin2%\%config2%\Hist*\*.*"
del /f/s/q		"%HomePath%\%config2%\Hist*\*.*"
del /q/s/f		"%userprofile%\%config2%\Hist*\History.IE5\index.dat" > NUL
del /q/s/a:r	"%userprofile%\%config2%\Hist*"
del /q/s/a:a	"%userprofile%\%config2%\Hist*"
del /q/s/a:h	"%userprofile%\%config2%\Hist*"
Rmdir /s/q		"%userprofile%\%config2%\Hist*"
ping -n 3  0.0.0.0 > nul&cls

echo :::::::::::::::::::::Limpeza de arquivos de Cookies do IE::::::::::::::::::
del /f/s/q		"%Admin1%\Cookies\*.*" > NUL
del /f/s/q		"%Admin2%\Cookies\*.*" > NUL
del /f/s/q		"%HomePath%\Cookies\*.*"
del /q/s/a:r	"%userprofile%\Cookies"
del /q/s/a:a	"%userprofile%\Cookies"
del /q/s/a:h	"%userprofile%\Cookies"
del /q/s		"%userprofile%\Cookies\index.dat" > NUL
ping -n 3  0.0.0.0 > nul&cls

echo ::::::::::Limpeza dos arquivos Temporarios do Internet explorer::::::::::::
del /f/s/q		"%Admin1%\%config1%\Temporary Internet Files\*.*"
del /f/s/q		"%Admin1%\%config1%\Temporary Internet Files\Content.IE5\*.*"
RmDir /s/q		"%Admin1%\%config1%\Temporary Internet Files"
del /f/s/q		"%Admin2%\%config1%\Temporary Internet Files\*.*"
del /f/s/q		"%Admin2%\%config1%\Temporary Internet Files\Content.IE5\*.*"
RmDir /s/q		"%Admin2%\%config1%\Temporary Internet Files"
del /f/s/q		"%SystemDrive%\Documents and Settings\NetworkService\%config1%\Temporary Internet Files\*.*"
del /f/s/q		"%SystemDrive%\Documents and Settings\NetworkService\%config1%\Temporary Internet Files\*.*"
del /f/s/q		"%SystemDrive%\Documents and Settings\LocalService\%config1%\Temporary Internet Files\*.*"
del /f/s/q		"%SystemDrive%\Documents and Settings\LocalService\%config1%\Temporary Internet Files\*.*"
del /f/s/q		"%SystemDrive%\Documents and Settings\NetworkService\%config2%\Temporary Internet Files\*.*"
del /f/s/q		"%SystemDrive%\Documents and Settings\NetworkService\%config2%\Temporary Internet Files\*.*"
del /f/s/q		"%SystemDrive%\Documents and Settings\LocalService\%config2%\Temporary Internet Files\*.*"
del /f/s/q		"%SystemDrive%\Documents and Settings\LocalService\%config2%\Temporary Internet Files\*.*"
del /f/s/q		"%HomePath%\%config1%\Temporary Internet Files\*.*"
RmDir /s/q		"%HomePath%\%config1%\Temporary Internet Files\"
del /f/s/q		"%HomePath%\%config2%\Temporary Internet Files\*.*"
RmDir /s/q		"%HomePath%\%config2%\Temporary Internet Files\"
del /q/s/a:r	"%userprofile%\%config1%\Temporary Internet Files"
del /q/s/a:a	"%userprofile%\%config1%\Temporary Internet Files"
del /q/s/a:h	"%userprofile%\%config1%\Temporary Internet Files"
del /q/s/f		"%userprofile%\%config1%\Temporary Internet Files\Content.IE5\index.dat" > NUL
del /q/s/a:r	"%userprofile%\%config2%\Temporary Internet Files"
del /q/s/a:a	"%userprofile%\%config2%\Temporary Internet Files"
del /q/s/a:h	"%userprofile%\%config2%\Temporary Internet Files"
del /q/s/f		"%userprofile%\%config2%\Temporary Internet Files\Content.IE5\index.dat" > NUL
del /f/s/q		"%HomePath%\IECompatCache\*.*"
del /f/s/q		"%HomePath%\IETldCache\*.*"
ping -n 3  0.0.0.0 > nul&cls

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
ping -n 3  0.0.0.0 > nul&cls

:firefox
echo :::::::::::::::::::::::EXECUTANDO LIMPEZA DO FIREFOX::::::::::::::::::::::
if not exist "%programfiles%\MOZILLA\firefox.exe" echo FIREFOX nao insalado&goto chrome
echo Excluindo arquivos temporแrios do Mozilla Firefox
cd "%HomePath%\%dados1%\Mozilla\Firefox\Profiles"
cd "%HomePath%\%dados2%\Mozilla\Firefox\Profiles"
del /f /q /s "*.sqlite"
ping -n 3  0.0.0.0 > nul&cls

:chrome
echo :::::::::::::::::::::::EXECUTANDO LIMPEZA DO CHROME:::::::::::::::::::::::
if not exist "%HomePath%\%config1%\%dados1%\Google\Chrome\Application\chrome.exe" echo Google Chrome nao instalado&goto chrome2
:chrome2
if not exist "%HomePath%\%config2%\%dados2%\Google\Chrome\Application\chrome.exe" echo Google Chrome nao instalado&goto chrome3
:chrome3
%SystemDrive%&cd \
del /f/s/q  "%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\History"
del /f/s/q  "%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Cookies"
del /f/s/q  "%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Current Session"
del /f/s/q  "%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Archived History"
del /f/s/q  "%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Visited Links"
del /f/s/q  "%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Cache\*.*"
del /f/s/q  "%HomePath%\%config1%\%dados1%\Google\Chrome\User Data\Default\Media Cache\*.*"


del /f/s/q  "%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\History"
del /f/s/q  "%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Cookies"
del /f/s/q  "%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Current Session"
del /f/s/q  "%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Archived History"
del /f/s/q  "%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Visited Links"
del /f/s/q  "%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Cache\*.*
del /f/s/q  "%HomePath%\%config1%\%dados2%\Google\Chrome\User Data\Default\Media Cache\*.*"

del /f/s/q  "%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\History"
del /f/s/q  "%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Cookies"
del /f/s/q  "%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Current Session"
del /f/s/q  "%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Archived History"
del /f/s/q  "%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Visited Links"
del /f/s/q  "%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Cache\*.*
del /f/s/q  "%HomePath%\%config2%\%dados2%\Google\Chrome\User Data\Default\Media Cache\*.*"
ping -n 3  0.0.0.0 > nul&cls

:java_flash
echo ::::::::::::::::::::EXECUTANDO LIMPEZA DO FLASH E JAVA::::::::::::::::::::
del /f/s/q  "%HomePath%\%dados1%\Sun\Java\Deployment\cache\*.*" > NUL
del /f/s/q  "%HomePath%\%dados2%\Sun\Java\Deployment\cache\*.*" > NUL
del /f/s/q  "%HomePath%\%dados1%\Sun\Java\Deployment\log\*.*" > NUL
del /f/s/q  "%HomePath%\%dados2%\Sun\Java\Deployment\log\*.*" > NUL
del /f/s/q  "%HomePath%\%dados1%\Sun\Java\Deployment\SystemCache\*.*" > NUL
del /f/s/q  "%HomePath%\%dados2%\Sun\Java\Deployment\SystemCache\*.*" > NUL
del /f/s/q  "%HomePath%\%dados1%\Macromedia\Flash Player\#SharedObjects\*.*" > NUL
del /f/s/q  "%HomePath%\%dados2%\Macromedia\Flash Player\#SharedObjects\*.*" > NUL

ping -n 3  0.0.0.0 > nul&cls

echo :::::::::::::::LIMPEZA DE NAVEGADORES FINALIZADA COM SUCESSO::::::::::::::
start explorer
ping -n 3  0.0.0.0 > nul&cls

::flag reservada para que a op็ใo "TODOS OS MODULOS FUNCIONE"
If %vFlag%==1 goto 2sys2
goto menu





:2sys
title %newtitle% - Limpeza do Sistema
::op็ใo 2 do menu
::limpa lixeira, arquivos temporarios do windows
::limpa prefetch, caches, logs, winrar
::limpa temporarios de alguns antivirus
::limpa algumas MRUs
@color 47
msg /time:15 * ATENวรO, o TrashCleaner %vVersao% vai finalizar programas abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ออออออออออออออออออออออออออออออออออออ ATENCAO ออออออออออออออออออออออออออออออออออ
echo        Para a seguranca salve qualquer documento que esteja trabalhando
echo.
echo        Caso nao esteja trabalhando em nenhum documento ou ja tenha salvo
echo                     Pressione qualquer tecla para continuar
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
pause > nul
@color 17

:2sys2
If %vFlag%==1 title %newtitle%   -   Etapa 2/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando AMBIENTE DE TRABALHO (explorer.exe)
@taskkill /f /im "explorer.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
ping -n 3  0.0.0.0 > nul&cls

echo ::::::::::LIMPEZA DOS ARQUIVOS TEMPORARIOS DO MICROSOFT WINDOWS::::::::::::
SFC /Purgecache
del /f/s/q		"%HomeDrive%\.DS_Store"
del /f/s/q		".DS_Store"
del /f/s/q		"%SystemDrive%\RECYCLER\*.*"
del /f/s/q		"%HomeDrive%\RECYCLER\*.*"
del /f/s/q		"%TEMP%\*.*"
del /f/s/q		"%HomePath%\%config1%\Temp\*.*"
del /f/s/q		"%HomePath%\%config2%\Temp\*.*"
del /f/s/q		"%SystemDrive%\Temp\*.*"
del /f/s/q		"%HomePath%\Temp\*.*"
del /f/s/q		"%Admin1%\%config1%\Temp\*.*"
RmDir /s/q		"%Admin1%\%config1%\Temp"
del /f/s/q		"%Admin2%\%config2%\Temp\*.*"
RmDir /s/q		"%Admin2%\%config2%\Temp"
del /f/s/q		"%Systemroot%\system32\config\systemprofile\%config1%\Temp\*.*"
del /f/s/q		"%Systemroot%\system32\config\systemprofile\%config2%\Temp\*.*"
del /f/q/s/a:r	"%TEMP%"
del /f/q/s/a:a	"%TEMP%"
del /f/q/s/a:h	"%TEMP%"
Rmdir /q/s		"%TEMP%"
del /f/s/q		"%HomePath%\Recent\*.*"
del /f/s/q		"%SystemDrive%\*.tmp"
del /f/s/q		"%SystemDrive%\*.temp"
del /f/s/q		"%SystemRoot%\*.tmp"

del /f/s/q		"%HomePath%\%config1%\%dados1%\Microsoft\Media Player\Transcoded Files Cache\*.*"
del /f/s/q		"%HomePath%\%config1%\%dados2%\Microsoft\Media Player\Transcoded Files Cache\*.*"
del /f/s/q		"%HomePath%\%config2%\%dados2%\Microsoft\Media Player\Transcoded Files Cache\*.*"

del /f/s/q		"%Systemroot%\Prefetch\*.*"
del /f/f/q/s/a:a	"%SystemRoot%\Prefetch"

del /f/s/q		"%SystemDrive%\*.DMP"
del /f/s/q		"%Systemroot%\*.dmp"
del /f/s/q		"%Systemroot%\minidump\*.*"
del /f/s/q		"%SystemRoot%\Minidump"

del /f/s/q		"%Systemroot%\System32\wbem\Logs\*.*"
del /f/s/q		"%Systemroot%\*.log"
del /F/s/q		"%SystemDrive%\*.log"
del /F/s/q		"%HomeDrive%\*.log"
del /f/s/q		"%ALLUSERSPROFILE%\%dados2%\Microsoft\WLSetup\Logs\*.*"
RmDir /s/q		"%SystemDrive%\spoolerlogs"

del /f/s/q		"%SystemDrive%\*.sqm"
del /f/s/q		"%HomeDrive%\*.sqm"
del /f/s/q		"C:\*.sqm"
del /f/s/q		"D:\*.sqm"
del /f/s/q		"%SystemDrive%\sqmnoopt*.sqm
del /f/s/q		"%HomeDrive%\sqmnoopt*.sqm

del /f/s/q		"%ALLUSERSPROFILE%\%dados1%\Microsoft\Dr Watson\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados2%\Microsoft\Dr Watson\*.*"

del /f/s/q		"%ALLUSERSPROFILE%\%dados1%\avg7\Log\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados2%\avg7\Log\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados1%\avg8\Log\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados2%\avg8\Log\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados1%\avg9\Log\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados2%\avg9\Log\*.*"
del /f/s/q		"%ALLUSERSPROFILE%\%dados1%\Kaspersky Lab\AVP8\Data\*.*
del /f/s/q		"%ALLUSERSPROFILE%\%dados2%\Kaspersky Lab\AVP8\Data\*.*
del /f/s/q		"%SystemDrive%\qoobox\*.*"
RmDir /s/q		"%SystemDrive%\qoobox\"

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

echo :::::::::::LIMPEZA DE TEMPORARIOS DO MICROSOFT WINDOWS TERMINADA::::::::::
start explorer
ping -n 3  0.0.0.0 > nul&cls

::flag reservada para que a op็ใo "TODOS OS MODULOS FUNCIONE"
If %vFlag%==1 goto 3msn2
goto menu





:3msn
title %newtitle% - Limpeza do MSN e Skype
::op็ใo 3 do menu
::limpa arquivos temporios do msn
::limpa cache de inslata็ใo e login salvo
@color 47
msg /time:15 * ATENวรO, o TrashCleaner %vVersao% vai fechar seu msn e skype aberto, tenha certeza de ter finalizado suas conversas antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ออออออออออออออออออออออออออออออออออออ ATENCAO ออออออออออออออออออออออออออออออออออ
echo        Para a seguranca salve qualquer documento que esteja trabalhando
echo.
echo        Caso nao esteja trabalhando em nenhum documento ou ja tenha salvo
echo                     Pressione qualquer tecla para continuar
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
pause > nul
@color 17

:3msn2
If %vFlag%==1 title %newtitle%   -   Etapa 3/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando MSN
@taskkill /f /im "msnmsgr.exe"
@taskkill /f /im "skype.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
ping -n 3  0.0.0.0 > nul&cls

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

Del /f/s/q "%HomePath%\Contacts\*.*"
Del /f/s/q "%USERPROFILE%\Contacts"
rmdir /s/q "%HomePath%\Contacts\"

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

::flag reservada para que a op็ใo "TODOS OS MODULOS FUNCIONE"
If %vFlag%==1 goto 4svi2
goto menu




:4svi
title %newtitle% - Limpeza Restauracao do sistema
::op็ใo 4 do menu
::limpa arquivos de recupera็ใo do windows (limpa a pasta SYSTEM VOLUME INFORMATION)
::muitas vezes virus acabam infectando essa pasta e NORMALMENTE anti-virus nใo conseguem escanea-la
@color 47
msg /time:15 * ATENวรO, o TrashCleaner %vVersao% vai finalizar programas abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ออออออออออออออออออออออออออออออออออออ ATENCAO ออออออออออออออออออออออออออออออออออ
echo        Para a seguranca salve qualquer documento que esteja trabalhando
echo.
echo        Caso nao esteja trabalhando em nenhum documento ou ja tenha salvo
echo                     Pressione qualquer tecla para continuar
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
pause > nul
@color 17

:4svi2
If %vFlag%==1 title %newtitle%   -   Etapa 4/4
echo :::::::::::::::::::::::::: FINALIZANDO PROGRAMAS ::::::::::::::::::::::::::
echo Finalizando AMBIENTE DE TRABALHO (explorer.exe)
@taskkill /f /im "explorer.exe"
echo :::::::::::::::::::::::::::PROCESSO FINALIZADO COM EXITO:::::::::::::::::::
ping -n 3  0.0.0.0 > nul&cls

CACLS "%SystemDrive%\System Volume Information" /T /E /G %UserName%:F
CACLS "c:\System Volume Information" /T /E /G %UserName%:F
CACLS "d:\System Volume Information" /T /E /G %UserName%:F
CACLS "e:\System Volume Information" /T /E /G %UserName%:F
CACLS "f:\System Volume Information" /T /E /G %UserName%:F
CACLS "g:\System Volume Information" /T /E /G %UserName%:F
CACLS "h:\System Volume Information" /T /E /G %UserName%:F
CACLS "i:\System Volume Information" /T /E /G %UserName%:F
CACLS "j:\System Volume Information" /T /E /G %UserName%:F
CACLS "k:\System Volume Information" /T /E /G %UserName%:F
Del    /F /S /Q          "%SystemDrive%\System Volume Information\*.*"
RmDir     /S /Q          "%SystemDrive%\System Volume Information"
Del    /F /S /Q          "c:\System Volume Information\*.*"
RmDir     /S /Q          "c:\System Volume Information"
Del    /F /S /Q          "d:\System Volume Information\*.*"
RmDir     /S /Q          "d:\System Volume Information"
Del    /F /S /Q          "e:\System Volume Information\*.*"
RmDir     /S /Q          "e:\System Volume Information"
Del    /F /S /Q          "f:\System Volume Information\*.*"
RmDir     /S /Q          "f:\System Volume Information"
Del    /F /S /Q          "g:\System Volume Information\*.*"
RmDir     /S /Q          "g:\System Volume Information"
Del    /F /S /Q          "h:\System Volume Information\*.*"
RmDir     /S /Q          "h:\System Volume Information"
Del    /F /S /Q          "i:\System Volume Information\*.*"
RmDir     /S /Q          "i:\System Volume Information"
Del    /F /S /Q          "j:\System Volume Information\*.*"
RmDir     /S /Q          "j:\System Volume Information"
Del    /F /S /Q          "k:\System Volume Information\*.*"
RmDir     /S /Q          "k:\System Volume Information"

start explorer
Set vFlag=0
goto menu






:5tudo
title %newtitle% - Limpeza completa
::op็ใo 5 do menu
::executa todas as op็๕es anteriores
Set vFlag=1
@color 47
msg /time:15 * ATENวรO, o TrashCleaner %vVersao% vai finalizar varios programas abertos, tenha certeza de ter salvo todo o seu trabalho antes de pressionar OK ou fechar esta mensagem!!!
echo.&echo.
echo ออออออออออออออออออออออออออออออออออออ ATENCAO ออออออออออออออออออออออออออออออออออ
echo        Para a seguranca salve qualquer documento que esteja trabalhando
echo.
echo        Caso nao esteja trabalhando em nenhum documento ou ja tenha salvo
echo                     Pressione qualquer tecla para continuar
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
pause > nul
@color 17
goto 1browser2






:6sobre
title %NewTitle% - Sobre
echo อออออออออออออออออออออออออออออออออออ Sobre อออออออออออออออออออออออออออออออออออออ
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo Versao Reescrita incluindo alguns algoritmos e caminhos do Script:
echo    LIMPEZA (2009) escrito por BOSS HEAD (http://batch-satti.forumeiros.com)
echo.
echo Versao executavel criada com 7-Zip SFX - Copyright (C) 1999-2009 Igor Pavlov
echo    7-zip sobre licenca 3 GNU LGPL (http://www.gnu.org/licences/lgpl.html)
echo.
echo MS-DOS, MSN e Windows - (C) Copyright Microsoft Corp. (http://microsoft.com)
echo.
echo             Skype - (c) Skype Technologies S.A. (http://skype.com)
echo.
echo       Winrar - (c) Eugene Roshal / Alexander Roshal (http://rarsoft.com)
echo Flash Player -(c) Adobe(http://adobe.com) - Java -(c) Sun(http://java.sun.com)
echo.
echo Agradecimento especiais:
echo Domingos Baiocchi / Samir Campones / Boss Head / Igor Pavlov / Joao Elias
echo.
echo corrigidos alguns bugs quando executado em windows em ingles (incluindo XP-64)
echo Adicionados alguns novos caminhos temporarios
echo              LICENCAS ADICIONAIS INCLUSAS NO PACOTE EXECUTAVEL
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
pause >nul
cls
echo.
echo.
echo.
echo Trash Cleaner de Luciano Branco e licenciado sob uma Licen็a Creative Commons
echo Atribuicaoo-Uso nao-comercial-Compartilhamento pela mesma licen็a 3.0 Unported.
echo http://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os creditos
echo ao criador (Luciano Branco / thelucianobranco@gmail.com)
echo.
echo caso modifique o codigo so podera distribui-lo utilizando a mesma licenca
echo gratuita e tambem permitindo modificacao ao SEU codigo!!!
echo.
echo Permissoes al้m do escopo dessa licen็a podem estar disponํvel atravez do email
echo thelucianobranco@gmail.com
echo.
echo.
	Set /P licenca=	Tecle 1 depos [ENTER] para ver a licenca ou apenas [ENTER] para fechar: 
	Cls
	If %licenca% equ 1 start "" http://creativecommons.org/licenses/by-nc-sa/3.0

goto menu




:7submenu
set subm=
title %newtitle% - Sub-Menu
cls
echo อออออออออออออออออออออออออออออออออออSUB-MENUออออออออออออออออออออออออออออออออออออ
echo ..%NewTitle%..
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo                               Selecione uma Opcao
echo.
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo		 1  - Visualizar e Finalizar processos
echo		 2  - Iniciar/Reiniciar Processo "EXPLORER.EXE" (AMBIENTE DE TRABALHO)
echo		 3  - Iniciar processo
echo		 4  - Resetar Permicoes/Restricoes
echo อออออออออออออออออออออออออออออออ OPERACOES DE IP อออออออออออออออออออออออออออออออ
echo		5 - Renovar Endereco IP (v4 e v6)
echo		6 - Cofigurar para DHCP (ip automatico)
echo		7 - Salvar configuracao em  "%homedrive%\IPconfig.txt" 
echo		8 - Restaurar configuracao de "%homedrive%\IPconfig.txt"
echo		9 - Backup ("%homedrive%\IPconfig.txt") + DHCP
echo		0 - Voltar ao menu anterior
echo อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
	Set /P subm=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %subm% equ 0 goto menu
	If %subm% equ 1 goto 71processos
	If %subm% equ 2 taskkill /f /im "explorer.exe"&start explorer&GoTo 7submenu
	If %subm% equ 3 goto 73novo_processo
	If %subm% equ 4 goto 74permicoes

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

:74permicoes
echo Digite 0 Para volta ao menu
set /p drive=Por Favor entre com a letra da unidade:
if %drive% == 0 goto Inicio
cls
echo Esta opcao vai reiniciar TODAS as permicoes para TODOS os usuarios
echo todas as pastas e SUBPASTAS da unidade %drive% vao ter as permicoes alteradas
echo ---
echo Resetando permi็๕es da unidade _"%drive%:"_
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
netsh interface ip set address "Conexฦo local" dhcp
netsh interface ip set address "Conexฦo local 2" dhcp
netsh interface ip set address "Local Area Connection 2" dhcp

netsh interface ip set dns "Local Area Connection" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip set dns "Conexฦo local" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip set dns "Conexฦo local 2" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip set dns "Local Area Connection 2" source=static addr=8.8.8.8 register=PRIMARY
goto 7submenu

:bkpdhcp
netsh -c interface dump > "%homedrive%\IPconfig.txt"
netsh interface ip set address "Local Area Connection" dhcp
netsh interface ip set address "Conexฦo local" dhcp
netsh interface ip set address "Conexฦo local 2" dhcp
netsh interface ip set address "Local Area Connection 2" dhcp

netsh interface ip set address dns "Local Area Connection" static 8.8.8.8
netsh interface ip set address dns "Conexฦo local" static 8.8.8.8
netsh interface ip set address dns "Conexฦo local 2" static 8.8.8.8
netsh interface ip set address dns "Local Area Connection 2" static 8.8.8.8

ipconfig /flushdns
ipconfig /renew
ipconfig /renew6
ipconfig /release
ipconfig /release6
ipconfig /all
ipconfig /registerdns
goto 7submenu





:8oculto
::usar apenas se nใo for possivel exibir arquivos ocultos de forma convencional
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL /v CheckedValue /t Reg_DWORD /d 0x1 /f
echo para esta opcao ter efeito ้ necessario reiniciar o computador
goto menu





:bosshead
if,not,defined,.m_,set.m_=%*&if,not,defined,.m_,goto:eof
<nul,set/p.m_=%.m_:~0,1%&>nul,ping -n 1 0&set.m_=%.m_:~1%&if,defined,.m_ (goto:bosshead),else,(echo.)
goto:eof

:var
	set vCabeca=TrashCleaner! - Removedor de Arquivos Temporarios
	set vVersao=V 4.0.0
	set vData=10/05/2012
	set vRelease=%vVersao%    %vData%
	set NewTitle=%vCabeca%     %vRelease%
	set vFlag=0
	set vPath=%Path%;%CD%;%SystemDrive%;A:;B:;C:;D:;E:;F:G:;H:;I:;J:;K:;L:;M:;N:;O:;P:;Q:;R:;S:;T:;U:;V:;W:;X:;Y:;Z:
	set ok=_por cento concluido
	set opcao=
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
	set opcao=
del /f/s/q "%userprofile%\Trash Cleaner v400.bat"
exit
