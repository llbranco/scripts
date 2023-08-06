@echo off
:: Definindo variaveis do ambiente
setlocal
color 71
set build=1.2.1
set date=11/jun/23
set ano=2023
set versao=Instalador do Spicetify ver: %build% - %date%
set obrigado=Obrigado por instalar o %versao%
set pasta="%homepath%\spicetify"
set ps1="%pasta%\spicetify.ps1"

rename %0 "Spicetify_Install%build%.bat"

title  %versao% -- %ano% -- By: llbranco

:: Definindo vFlags
:validandoaquivops1
cd %homepath%
set vFlag_completo=1
if exist %ps1% (
goto menuprincipal
) else (
echo %ps1% nao encontrado
echo criando pasta
md %pasta%
echo criando script
pause


echo iwr ^-useb https^:^/^/raw.githubusercontent.com^/spicetify^/spicetify^-cli^/master^/install.ps1 ^| iex>%ps1%
echo iwr ^-useb https^:^/^/raw.githubusercontent.com^/spicetify^/spicetify^-marketplace^/main^/resources^/install.ps1 ^| iex>>%ps1%

echo arquivo %ps1% criado
pause
)

cls
:menuprincipal
set opcao=0
set vFlag_hosts=0
set vFlag_registro=0
set vFlag_completo=0

cls
echo -------------------------------------------------------------------------------
echo    %versao% %instalado%
echo -------------------------------------------------------------------------------
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo          Apenas uma interface amigavel para instalacao do spicetify.app
echo           acesse o site oficial http://spicetify.app
echo           thelucianobranco@gmail.com          Petropolis - RJ - Brasil
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo -------------------------------------------------------------------------------
echo                               Selecione uma Opcao
echo -------------------------------------------------------------------------------
echo 1  - Instalar ou Reinstalar (corrige alguns bugs)
echo 2  - Atualizar (UPDATE, use apos fazer uma reinstalacao)
Echo 3  - Atualizar (UPGRADE, use caso o spotify atualize e vc perca o marketplace)
echo 4  - Renovar DNS 
echo -------------------------------------------------------------------------------

 Set /P opcao= Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
 Cls
 If %opcao% equ 0 goto fim
 If %opcao% equ 1 goto install
 If %opcao% equ 2 goto update
 If %opcao% equ 3 goto upgrade
 if %opcao% equ 4 goto dns
goto fim

:install
start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -Verb RunAs powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File "%ps1%"' "
goto fim

:update
spicetify backup apply
spicetify apply
goto fim

:upgrade
spicetify upgrade
spicetify restore backup apply
goto install
pause
goto fim

:dns
IPCONFIG /RELEASE
IPCONFIG /RENEW
IPCONFIG /FLUSHDNS
cls
echo limpar cache de navegadores baseados em Chrome
echo mude a URL para
echo NomeDoNavegador://net-internals/#dns
start "" http://chrome//net-internals/#dns
pause

:fim
endlocal
goto :eof