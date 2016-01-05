@echo off
setlocal
cd %systemdrive%
title Anti-facebook ver: 1.0 -- InfoBR 2013 -- By: llbranco
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo.
echo             Anti-Facebook permite bloquear acesso ao Facebook
echo                               Selecione uma Opcao
echo.
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo	 1  - Redirecionar Facebook para Google
echo          (faz a pessoa achar que o erro e do Facebook)
echo.
echo	 2  - Redirecionar para localhost (127.0.0.1) 
echo          (Mostra pagina de erro informando que o Facebook nao esta acessivel)
echo.
echo	 3  - Escolher um outro IP
echo          (Digite o IP na qual vc deseja redirecionar o Facebook)
echo.
echo.
	Set /P opcao=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %opcao% equ 1 goto google
	If %opcao% equ 2 goto localhost
	If %opcao% equ 3 goto outro
exit

:google
set facebook=74.125.234.84
goto antifacebook

:localhost
set facebook=127.0.0.1
goto antifacebook

:outro
Set /P facebook=	Digite o endereco IP que deseja siguido de [ENTER]: 
goto antifacebook

:antifacebook
echo.>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "localhost" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo 127.0.0.1 localhost>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "#Anti-facebook" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo #Anti-Facebook>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% static.ak.fbcdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% static.ak.fbcdn.net>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.static.ak.fbcdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.static.ak.fbcdn.net>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% login.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% login.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.login.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.login.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% fbcdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% fbcdn.net>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.fbcdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.fbcdn.net>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% fbcdn.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% fbcdn.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.fbcdn.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.fbcdn.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% static.ak.connect.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% static.ak.connect.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% static.ak.connect.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% static.ak.connect.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.static.ak.connect.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.static.ak.connect.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% blog.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% blog.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% apps.facebook.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% apps.facebook.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% fb.com www.fb.com fb.com.br www.fb.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% fb.com www.fb.com fb.com.br www.fb.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% blog.facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo 127.0.0.1 localhost>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% apps.facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% apps.facebook.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.facebook.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% facebook.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% login.facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% login.facebook.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.login.facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.login.facebook.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% fbcdn.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% fbcdn.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.fbcdn.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.fbcdn.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% static.ak.connect.facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% static.ak.connect.facebook.com.br>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "%facebook% www.static.ak.connect.facebook.com.br" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 echo %facebook% www.static.ak.connect.facebook.com.br>>%WINDIR%\system32\drivers\etc\hosts

echo Verifique, caso haja alguma mensagem de erro
echo tente executar como Administrador
echo.
echo Pressione qualquer tecla para fechar
pause>nul
exit
