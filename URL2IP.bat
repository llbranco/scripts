@echo off
setlocal
title URL2IP v1.2 - By llbranco - thelucianobranco@gmail.com - 10/06/15
rename %0 "URL2IP.bat"

set level3v41=4.2.2.1
set level3v42=4.2.2.2
set level3v43=4.2.2.3
set level3v44=4.2.2.4
set googlev4=8.8.8.8
set googlev6=2001:4860:4860::8888
set opendnsv4=208.67.222.222
::opendns ainda nao tem servidores v6 estavel (ate a data deste script)
set opendnsv6=2620:0:ccc::2
set gigadnsv4=189.38.95.95
set gigadnsv6=2804:10:10::10
set linha=--------------------------------------------------------------------------------

:inicio
set urlv4=
set urlv6=
set dnsv4=
set dnsv6=
set opcao=1
cls
echo ------------------------------------ URL2IP -----------------------------------
echo URL2IP de Luciano Branco e licenciado sob uma Licenca Creative Commons
echo Atribuicao-Uso nao-comercial-Compartilhamento pela mesma licenca 3.0 Unported.
echo http://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os creditos
echo ao criador (Luciano Branco / thelucianobranco@gmail.com)
echo caso modifique o codigo so podera distribui-lo utilizando a mesma licenca
echo gratuita e tambem permitindo modificacao ao SEU codigo!!!
echo Permissoes alem do escopo dessa licenca podem estar disponivel atravez do email
echo thelucianobranco@gmail.com
echo.
echo         Use a Opcao (9) para Acessar a Pagina de Teste de IPv6
echo %linha%
echo              Por Favor escolha a versao do protocolo e servidor DNS
echo %linha%
echo 1) IPv4 - GoogleDNS        3)IPv4 - OpenDNS        5)IPv4 - GigaDNS
echo 2) IPv6 - GoogleDNS        4)IPv6 - OpenDNS[beta]  6)IPv6 - GigaDNS
echo 7) IPv4 - Level3DNS1       8)IPv4 - Level3DNS2     9)IPv4 - Level3DNS3
echo %linha%
echo obs: IPv6 nao funciona em rede INCOMPATIVEL, ou de um tunel ipv6

   set /P opcao=   Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para IPv4 Google: 
   Cls
   If %opcao% equ 1 set dnsv4=%googlev4%&goto v4
   If %opcao% equ 2 set dnsv6=%googlev6%&goto v6
   If %opcao% equ 3 set dnsv4=%opendnsv4%&goto v4
   If %opcao% equ 4 set dnsv6=%opendnsv6%&goto v6
   If %opcao% equ 5 set dnsv4=%gigadnsv4%&goto v4
   If %opcao% equ 6 set dnsv4=%gigadnsv6%&goto v6
   If %opcao% equ 7 set dnsv6=%level3v41%&goto v4
   If %opcao% equ 8 set dnsv4=%level3v42%&goto v4
   If %opcao% equ 9 set dnsv4=%level3v43%&goto v4
   If %opcao% equ 0 goto testev6
goto fim

:testev6
start "" www.test-ipv6.com
goto inicio

:v4
echo resolvendo IPv4
echo digite a URL que deseja analizar
echo URL sem http (ex: www.google.com ou google.com)
   set /P urlv4=   [URL]: 
   Cls

nslookup -debug %urlv4%. %dnsv4%
echo. pressione qualquer tecla para retornar ao menu
pause>nul
goto inicio

:v6
echo resolvendo IPv6
echo digite a URL que deseja analizar
echo URL sem http (ex: www.google.com ou google.com)
   set /P urlv6=   [URL]: 
   Cls

nslookup -debug -type=AAAA %urlv6%. %dnsv6%
echo. pressione qualquer tecla para retornar ao menu
pause>nul
goto inicio

:fim
goto eof
