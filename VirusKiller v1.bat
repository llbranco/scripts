@Echo off
TITLE VIRUS KILLER  - V 1.0 - thelucianobranco@gmail.com
:: Definindo variaveis
color 2f
setlocal
set pendrive=d
echo Antes de executar o Virus Killer
echo certifique-se de saber a letra da unidade
echo do pendrive que deseja limpar
echo.
echo deseja executar o Virus Killer?
echo [S]im ou [N]ao
Set /P iniciar=   Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 

cls
If %iniciar% equ s goto killer
If %iniciar% equ S goto killer
goto fim

:killer

echo Em que unidade deseja executar o Virus Killer?
echo digite APENAS A LETRA DA UNIDADE
echo ex: caso queira limpar a unidade (D:) digite apenas (D)
Set /P unidade=   Tecle a opcao desejada e [ENTER] para iniciar a limpeza: 

if %unidade% equ c goto unidadec
if %unidade% equ C goto unidadec

cls
echo acessando unidade "%unidade%":
@echo on
%unidade%:
pause 
@echo off



ECHO Mostrando arquivos OCULTOS
ATTRIB -R -A -S -H /S /D
Echo deletando os arquivos conhecidos do virus
DEL /Q/S HOMEP.EXE
DEL /Q/S HOMEP.SCR
DEL /Q/S MICROSOFT.VBA
DEL /Q/S MICROSOFT.VBE
DEL /Q/S AUTORUN.INF
DEL /Q/S *.lnk
DEL /Q/S *.scr
echo.
echo criando uma pasta para previnir possiveis infeccoes
MKDIR AUTORUN.INF
echo tornando a pasta protegida
ATTRIB +R +A +S AUTORUN.INF
echo.

:fim
echo processo terminado
echo pressione qualquer tecla para finalizar
pause > nul
endlocal
exit

:unidadec
cls
color 4f
echo voce esta tentando passar o virus killer na unidade "C"
echo o virus killer nao foi projetado para isso
echo tente novamente
pause
color 2f
cls
goto killer
endlocal
exit
