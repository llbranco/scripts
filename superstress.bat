@echo off
color 17
::definindo variaveis
	setlocal
	set vCabeca=SuperStress! - Stress de Hardware
	set vVersao=1.2.1
	set vData=14/03/2024
	set vRelease=V %vVersao%    %vData%
	set NewTitle=%vCabeca%     %vRelease%
	set vFlag=0
	
	set aleatorio=
	set aleatorio2=
	set stressnum1=0
	set stressnum2=10
	set stressnum3=0

	set dummynum=0
	
	set stressping1=0
	set stressping2=50
	set script=%TMP%\superstress
	
::rename %0 "SuperStress%vVersao%.bat"

:menu
title %newtitle%
set opcao=
cls&ver
echo ===============================================================================
echo ..%NewTitle%..
echo ===============================================================================
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                 Projeto de Luciano Branco iniciado em 08/12/2014
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo ===============================================================================
echo.
echo                               Selecione uma Opcao
echo.
echo ===============================================================================
echo	 1  - Teste de Calculo			(uso de CPU alto)
echo	 2  - Teste de Ping da Morte IPv4/v6	(uso de CPU medio)
echo	 3  - Dificultar Recuperacao de dados criando dummyfiles
echo	 4  - Abrir janelas INFINITAMENTE	(PODE DANIFICAR O PC)
echo	 5  - Calculo + Ping			(uso de CPU INTENSIVO, recomendado)
echo	 6  - Fork Bomb				(SUPER INTENSO)
echo	 0  - Sobre
echo	 9  - Fechar todas as janelas do script (fecha outros scripts tambem)
echo ===============================================================================
echo janelas abertas = CALCULOS (%stressnum1%) - PING (%stressping1%)
echo.
	Set /P opcao=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %opcao% equ 0 goto fim
	If %opcao% equ 1 goto 1stressnum
	If %opcao% equ 2 goto 2ping
	If %opcao% equ 3 goto 3dummyfill
	If %opcao% equ 4 goto 4infinito
	If %opcao% equ 5 goto 5numping
	If %opcao% equ 6 goto 6bomba
	If %opcao% equ 0 goto 0sobre
	If %opcao% equ 9 goto 9killall
goto fim

:5numping
set vFlag=1

:1stressnum
set /a stressnum1=%stressnum1%+1
(echo @echo off
echo setlocal
echo set aleatorio=%%random%%
echo set aleatorio2=%%random%%
echo title Teste de Stress Basico %stressnum1% de %stressnum2% - inicio em %%aleatorio%% somando %%aleatorio2%%
echo set stressnum3=%%aleatorio%%
echo :testeini
echo echo ^%%stressnum3^%%%
echo set /a stressnum3=^%%stressnum3^%%+^%%aleatorio2^%%
echo goto testeini
echo endlocal
) > %script%num%stressnum1%.bat
ping -n 3  0.0.0.0 > nul

if %stressnum1% LEQ %stressnum2% (
goto 11stressnum
) else (
If %vFlag%==1 (goto 2PING) else goto voltamenu
)
:: caso apresente erro o script interrompe o loop e vai pro fim
goto fim

:11stressnum
echo aguarde, carregando teste de calculo %stressnum1% de %stressnum2%
start /min "" cmd /k %script%num%stressnum1%.bat
goto 1stressnum
:: caso apresente erro o script interrompe o loop e vai pro fim
goto voltamenu



:2ping
set /a stressping1=%stressping1%+1
(echo @echo off
echo title Teste local de ping da morte %stressping1% de %stressping2%
echo setlocal
echo :testeini
echo ping -l 65500 127.0.0.1
echo ping -l 65500 -6 ::1
echo goto testeini
) > %script%ping%stressping1%.bat

if %stressping1% LEQ %stressping2% (
goto 21ping
) else (
goto voltamenu
)
:: caso apresente erro o script interrompe o loop e vai pro fim
goto fim

:21ping
echo aguarde, carregando teste de ping %stressping1% de %stressping2%
start /min "" cmd /k %script%ping%stressping1%.bat
goto 2ping
:: caso apresente erro o script interrompe o loop e vai pro fim
goto voltamenu



:3dummyfill
:: preencha no campo "exttiny" as extenções de arquivos que queira que tenha tamanhos pequenos
set exttiny=doc docx xls xlsx jpg jpeg rar zip txt log dll bmp mp3 wma png pst ppt pptx xml rtf
:: preencha no campo "exthuge" as extenções de arquivos que queira que tenha tamanhos grandes
set exthuge=pst rar zip iso nrg avi mpg mpeg wmv
:: preencha no campo "extXhuge" as extenções de arquivos que queira que tenha tamanhos gigantescos
set exthuge=

:31dummyloop
if %dummynum% LEQ 30 (
goto 32dummymake
) else (
goto dummydel
)
goto fim

:32dummymake
set /a dummynum=%dummynum%+1
for %%s in (%exttiny%) do fsutil file createnew "%temp%\%random%.%%s" %random%0
for %%s in (%exttiny%) do fsutil file createnew "%temp%\%random%.%%s" %random%%random%
for %%s in (%exthuge%) do fsutil file createnew "%temp%\%random%.%%s" %random%0%random%
for %%s in (%exthuge%) do fsutil file createnew "%temp%\%random%.%%s" %random%0%random%0%random%
goto 31dummyloop

:33dummydel
echo pressione qualquer tecla para apagar os arquivos dummy criados pelo SuperStress
echo para um melhor rendimento do script execute-o varias vezes
echo cada nova execucao melhora sua eficacia
pause>nul
del /f/s/q	"%temp%\*.*"
goto voltamenu

:4infinito
(echo @echo off
echo title Teste de janelas infinitas
echo setlocal
echo :testeini
echo start /min "" cmd /k echo SuperStress - janelas infinitas
echo start /min "" cmd /k %script%ininito.bat
echo goto testeini
) > %script%ininito.bat
start /min "" cmd /k %script%ininito.bat
goto voltamenu

:6bomba
title Teste Fork Bomb
echo Boa sorte, seu pc vai travar mto rapido
echo.
echo pressione qualquer tecla para iniciar o Fork Bomb

echo ^%%0^|^%%0>forkbomb.bat
pause
start /min "" forkbomb.bat
goto voltamenu

:0sobre
echo SuperStress de Luciano Branco e licenciado sob uma Licenca Creative Commons
echo Atribuicaoo-Uso nao-comercial-Compartilhamento pela mesma licenca 3.0 Unported.
echo http://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os creditos
echo ao criador (Luciano Branco / thelucianobranco@gmail.com)
echo.
echo caso modifique o codigo so podera distribui-lo utilizando a mesma licenca
echo gratuita e tambem permitindo modificacao ao SEU codigo!!!
echo.
echo Permissoes alem do escopo dessa licenca podem estar disponivel atravez do email
echo thelucianobranco@gmail.com
echo.
echo.
	Set /P licenca=	Tecle 1 depos [ENTER] para ver a licenca ou apenas [ENTER] para fechar: 
	Cls
	If %licenca% equ 1 start "" http://creativecommons.org/licenses/by-nc-sa/3.0
goto voltamenu	

:9killall
echo FINALIZANDO tarefas
if %stressping1% NEQ 0 (
@taskkill /f /im "cmd.exe"
@taskkill /f /im "ping.exe"
)
if %stressnum1% NEQ 0 @taskkill /f /im "cmd.exe"
goto voltamenu

:voltamenu
echo numero de janelas de stress abertas: %stressnum1%
echo numero de janelas de Ping abertas: %stressping1%
echo.
echo criando arquivo de log salvo em:
echo "%userprofile%\desktop\SuperStress_crashlog.txt"
echo nele sera indicado a hora de travamento/desligamento do pc

(echo @echo off
echo :clock
echo title teste indica a hora do travamento %time%
echo cls
echo echo este arquivo grava a cada segundo a hora atual do pc^>"%userprofile%\desktop\SuperStress_crashlog.txt"
echo echo caso o computador venha a travar ou desligar^>^>"%userprofile%\desktop\SuperStress_crashlog.txt"
echo echo voce podera saber quando ele travou ou desligou^>^>"%userprofile%\desktop\SuperStress_crashlog.txt"
echo echo %%time%%^>^>"%userprofile%\desktop\SuperStress_crashlog.txt"
echo echo %%time%%
echo goto clock
) > %script%crashlog.bat
start "" %script%crashlog.bat
echo Pressione qualquer tecla para retornar ao MENU
pause>nul
cls
goto menu

:fim
endlocal
goto:eof
exit
