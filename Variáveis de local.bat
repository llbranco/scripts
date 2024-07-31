@echo off & cd /d "%~dpn0"
title variaveis de local

echo/ ----------------------------------------------------------------
echo/ variaveis globais do sistema
echo/ ----------------------------------------------------------------
echo/ %%UserName%%	= %UserName%
echo/ %%SystemDrive%%	= %SystemDrive%		/	%%homedrive%%	= %homedrive%
echo/ %%SYSTEMROOT%%	= %SYSTEMROOT%	/	%%windir%%	= %windir%
echo/ %%HomePath%%			= %homepath%
echo/ %%userprofile%%			= %userprofile%
echo/ %%appdata%%			= %appdata%
echo/ %%localappdata%%			= %localappdata%

echo/ %%temp%%				= %temp%
echo/ %%ALLUSERSPROFILE%%		= %ALLUSERSPROFILE%
echo/ %%CommonProgramFiles%%		= %CommonProgramFiles%
echo/ ----------------------------------------------------------------
echo/ %%Path%% = (todos os caminhos abaixo)
echo/ %Path%


pause
timeout -t 5 

echo/ %%aaa%%				= %aaa%
echo/ %%aaa%%				= %aaa%

cls

for %%i in ("%windir%" "%appdata%" "%ALLUSERSPROFILE%")do cls & cd /d "%%~i" & call :^)
goto :eof
::Creditos https://pt.stackoverflow.com/questions/325750/buscar-nome-do-diret%C3%B3rio-de-um-arquivo-bat

:^)
echo/ ----------------------------------------------------------------
echo/ variaveis nao alteram seus valores
echo/ ----------------------------------------------------------------
echo/ %%~d0		= %~d0
echo/ %%~p0		= %~p0 
echo/ %%~dp0	= %~dp0
echo/ %%~dpn0	= %~dpn0
echo/ %%~f0		= %~f0
echo/ %%~dpnx0	= %~dpnx0


echo/ ----------------------------------------------------------------
echo/ pasta atual: %__CD__% 
echo/ ----------------------------------------------------------------
echo/ variaveis alteram seus valores para pasta atual
echo/ ----------------------------------------------------------------
echo/ %%CD%%              = %cd%
echo/ %%__CD__%%          = %CD%
echo/ ----------------------------------------------------------------
pause
timeout -t 5 & exit /b 
