@echo off
:: Definindo variaveis do ambiente
setlocal
color 71
set build=0.1
set date=25/ago/17
set ano=2017
set versao=Sporify ADS-Killer ver: %build% - %date%
set obrigado=Obrigado por instalar o %versao%
set hostsfile="%SystemRoot%\system32\drivers\etc\hosts"

set spotify_block=pubads.g.doubleclick.net securepubads.g.doubleclick.net www.googletagservices.com gads.pubmatic.com ads.pubmatic.com spclient.wg.spotify.com adclick.g.doublecklick.net adeventtracker.spotify.com ads-fa.spotify.com analytics.spotify.com audio2.spotify.com b.scorecardresearch.com bounceexchange.com bs.serving-sys.com content.bitsontherun.com core.insightexpressai.com crashdump.spotify.com d2gi7ultltnc2u.cloudfront.net d3rt1990lpmkn.cloudfront.net desktop.spotify.com doubleclick.net ds.serving-sys.com googleadservices.com googleads.g.doubleclick.net gtssl2-ocsp.geotrust.com js.moatads.com log.spotify.com media-match.com omaze.com open.spotify.com pagead46.l.doubleclick.net pagead2.googlesyndication.com partner.googleadservices.com redirector.gvt1.com s0.2mdn.net tpc.googlesyndication.com v.jwpcdn.com video-ad-stats.googlesyndication.com weblb-wg.gslb.spotify.com www.googleadservices.com www.omaze.com

:: Variaveis definidas
rename %0 "Spotify_ads-killer%build%.bat"
title  %versao% -- %ano% -- By: llbranco

:menuprincipal
set opcao=0
set vFlag_hosts=0
set vFlag_registro=0
set vFlag_completo=0
FIND /C /I "#%versao%" %hostsfile%
IF %ERRORLEVEL% NEQ 1 set instalado=esta instalado e atualizado.
IF %ERRORLEVEL% NEQ 0 set instalado=nao instalado ou esta desatualizado.

cls
echo -------------------------------------------------------------------------------
echo   %versao% %instalado%
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                    Projeto de Luciano Branco iniciado em 2017
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo -------------------------------------------------------------------------------
echo                               Selecione uma Opcao
echo -------------------------------------------------------------------------------
echo 1  - Instalar ou Atualizar o Bloqueio
echo 2  - Sobre
echo 3  - Abrir HOSTS no Bloco de Notas
echo 4  - Desinstalar
echo -------------------------------------------------------------------------------

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 0 goto fim
 If %opcao% equ 1 goto instalar
 If %opcao% equ 2 goto sobre
 If %opcao% equ 3 goto abrirhosts
 If %opcao% equ 4 goto desinstalar
goto fim

:instalar
:: ----------------------------------------- Liberanco permissões do arquivo -----------------------------------------
echo liberando acesso ao arquivo HOSTS
attrib -r -a -s -h %hostsfile%

:: --------------------------------------------------- Spotify Block ---------------------------------------------------
echo instalando o %versao%
(
echo #%versao% -- inicio
echo.
)>>%hostsfile%

for %%s in (%spotify_block%) do find /c /i "%%s" %hostsfile%>nul||(echo.Adicionando "%%s" ao bloqueio&echo.127.0.0.1 %%s>>%hostsfile%||echo.Acesso negado gravando %%s!)

(
echo.
echo.
echo #%versao% -- fim
)>>%hostsfile%

ipconfig /flushdns
goto menuprincipal

:sobre
echo.&echo.&echo.
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bit
echo           Foi testado e funciona perfeitamente do Windows XP ao 8.1
echo      Foi testado e funciona perfeitamente do Windows 2000 ao 2012 server
echo.
echo                    Projeto de Luciano Branco iniciado em 2017
echo.
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo.&echo.&echo.
pause
echo O trabalho Sporify ADS-Killer de Luciano Branco
echo está licenciado com uma Licença Creative Commons
echo Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional.
echo Baseado no trabalho disponível em https://github.com/llbranco/scripts
echo Podem estar disponíveis autorizações adicionais as
echo concedidas no âmbito desta licença em https://github.com/llbranco/scripts
echo.&echo.&echo.
pause
echo "Spotify ADS-killer" nao tem nenhuma ligacao direta ou indireta
echo com a empresa "Spotify".
echo.
echo o uso indevido ou nao autorizado desta ferramenta pode trazer problemas
echo quanto a violacao de direitos autorais ou outros problemas legais,
echo use por sua conta e risco.
echo.
echo o criador do script recomenda que voce pague pela versao premium,
echo use este script apenas para fins de estudo.
echo. 
echo o criador do script se isenta de toda e quaisquer responsabilidade de uso
echo de sua criacao (este script), visto que tal pratica viola os direitos 
echo de uso do software.
echo.
goto menuprincipal

:abrirhosts
start notepad %hostsfile%
goto menuprincipal

:desinstalar
:: ------------------------------------------------ Cabeçalho do HOSTS -----------------------------------------------
echo resetando o hosts
(
echo #%versao%
echo 127.0.0.1 localhost
echo ::1       localhost
echo.
echo.
)>%hostsfile%
goto menuprincipal

:fim
endlocal
goto :eof