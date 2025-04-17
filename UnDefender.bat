@echo off
color 17
:: definindo variaveis
	set app=UnDefender 
	set build=1.4.2
	set data=17/abr/25
	set NewTitle=%app% v%build%
	set opcao=0
	::pasta do wdac
	set wdac1=%windir%\System32\CodeIntegrity\CiPolicies\Active\
	set linha=================================================================================
	set github=https://github.com/llbranco/scripts
	set ms_ip=23.99.10.11,131.107.113.238,64.4.54.22,65.55.252.71,207.46.223.94,207.68.166.254,64.4.54.32,65.52.108.29,65.55.252.63,65.55.252.92,65.55.252.93,65.55.252.43,111.221.29.177,157.56.74.250,168.63.108.233,157.56.91.77,157.56.91.77,191.232.139.254,194.44.4.200,194.44.4.208,65.52.100.7,65.52.100.9,65.52.100.11,65.52.100.91,65.52.100.92,65.52.100.93,65.52.100.94,157.56.77.139,64.4.54.22,204.79.197.200,68.232.34.200,134.170.58.121,134.170.58.123,134.170.53.29,66.119.144.190,134.170.58.189,134.170.58.118,,134.170.53.30,134.170.51.190,64.4.6.100,65.55.39.10,134.170.185.70,104.82.22.249,204.79.197.200,134.170.115.60,131.107.113.238,157.56.121.89,23.102.21.4,207.46.194.25,157.55.129.21,173.194.113.220,173.194.113.219,216.58.209.166,157.56.91.82,157.56.23.91,104.82.14.146,207.123.56.252,185.13.160.61,8.254.209.254,134.170.115.60,207.46.101.29,104.82.22.249,65.55.108.23,23.218.212.69,204.79.197.200,64.4.54.32,68.232.34.200,65.52.100.7,65.52.100.91,65.55.252.63,68.232.34.200,198.78.208.254,185.13.160.61,185.13.160.61,8.254.209.254,207.123.56.252
	set fw_name=telemetry_from_microsoft
	
if _%1_==_payload_  goto :payload
cls

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload
::permitindo acentuacao
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 850>nul

:menu
title %newtitle%
set opcao=
cls&ver
echo ==============================================================%data%=========
echo ..%NewTitle%..
echo %linha%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo                 Projeto de Luciano Branco iniciado em 10/04/2024
echo            Duvidas, sugestoes ou criticas: https://github.com/llbranco/scripts
echo			%github%
echo %linha%
echo.
echo                               Selecione uma Op‡Æo
echo.
echo %linha%
echo	 1  - Tornar o Windows Defender mansinho pra cracks, keygen e ativadores
echo	 2  - Tornar o Windows Defender a MERDA que sempre foi
echo	 3  - Bloquear telemetria da Microsoft via firewall
echo	 4  - Correcao do MsMpEng alto uso de CPU/RAM
echo	 5  - Windows Defender Application Control (WDAC) hack
echo	 9  - Sobre
echo %linha%
echo.
	Set /P opcao=	Tecle a opcao desejada e [ENTER] ou apenas [ENTER] para fechar: 
	Cls
	If %opcao% equ 0 goto fim
	If %opcao% equ 1 goto undefender
	if %opcao% equ 2 goto redefender
	if %opcao% equ 3 goto telemetria
	if %opcao% equ 4 goto MsMpEng
	if %opcao% equ 5 goto wdac
	If %opcao% equ 9 goto sobre
goto fim

:fim
	set NewTitle=
	set Title=
	set opcao=
exit

:Sobre
title %NewTitle% - Sobre
echo =================================== Sobre =====================================
echo %app% versao %build% iniciado em 10/abr/24, data da versao atual:%data%
echo             Script em MS-DOS Batch para Microsoft Windows 32/64 Bits
echo            Duvidas, sugestoes ou criticas: thelucianobranco@gmail.com
echo			%github%
echo %linha%
echo UnDefender de Luciano Branco ‚ licenciado sob uma Licenca Creative Commons
echo Atribuicao Uso nao comercial Compartilhamento pela mesma licenca 3.0 Unported.
echo http://creativecommons.org/licenses/by-nc-sa/3.0/
echo.
echo sinta-se livre para distribuir e modificar, desde que mantenha os cr‚ditos
echo ao criador (Luciano Branco / thelucianobranco@gmail.com)
echo.
echo caso modifique o codigo so poder  distribui-lo utilizando a mesma licen‡a
echo gratuita e tambem permitindo modificacoes ao SEU codigo!!!
echo.
echo Permissoes alem do escopo dessa licen‡a podem estar disponiveis atravez do email
echo thelucianobranco@gmail.com
echo.
echo %linha%
echo piadas a parte, agora falando serio
echo eu nao promovo a pirataria, esse script serve apenas para estudo
echo se vc gosta de um sistema operacional ou app, recomendo que compre a licenca do mesmo
echo %linha%
echo.
	Set /P licenca=	Tecle 1 depos [ENTER] para ver a licenca ou apenas [ENTER] para fechar: 
	Cls
	If %licenca% equ 1 start "" http://creativecommons.org/licenses/by-nc-sa/3.0
goto menu

:undefender
echo.
echo %linha%
echo %app% est  fazendo suas mandingas e instalando prote‡äes
echo para tornar o defender manso como uma cadelinha mimada
echo %linha%
echo.
echo aguarde...
echo.
echo adicionando regras de firewall para bloquear telemetrias da microsoft (por ip)
netsh advfirewall firewall add rule name="%fw_name%" dir=out action=block remoteip=%ms_ip% enable=yes

for %%a in (
%windir%\system32\SppExtComObjHook.dll
%windir%\KMS-R@1n.exe
%windir%\KMS-R@1nHook.dll
%windir%\KMS-R@1nHook.exe
%windir%\system32\sppsvc.exe
"%ProgramFiles%\Windows Defender\MsMpEng.exe"
"%ProgramFiles%\Windows Defender Advanced Threat Protection\MsSense.exe"
) do (
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "&{Add-MpPreference -ExclusionPath "%%a" -Force|Add-MpPreference -ExclusionProcess "%%a" -Force}"
powershell.exe -NoLogo -command "&{Add-MpPreference -ExclusionProcess "%%a" -Force}"
)

for %%b in (
exe
msi
rar
zip
7z
gz
inf
dll
cab
ini
bin
iso
img
bat
cmd
ps1
efi
wim
esd
) do (
powershell.exe -NoLogo -command "&{Add-MpPreference -ExclusionExtension ".%%b" -Force}"
)
for %%b in (
"%ProgramFiles%\windows defender\"
"%ProgramFiles%\Windows Defender Advanced Threat Protection\"
"%Programdata%\Microsoft\Windows Defender\"

"%ProgramFiles%\avast\"
"%ProgramFiles%\Avast Software\"
"%ProgramFiles(x86)%\avast\"
"%ProgramFiles(x86)%\Avast Software\"
"%Programdata%\Avast\"
"%Programdata%\Avast Software\"

"%ProgramFiles%\norton\"
"%ProgramFiles(x86)%\norton\"
"%Programdata%\norton"

"%ProgramFiles%\Malwarebytes\"
"%ProgramFiles(x86)%\Malwarebytes\"
"%Programdata%\Malwarebytes\"

"%ProgramFiles%\avg\"
"%ProgramFiles%\AVG Software\"
"%ProgramFiles(x86)%\avg\"
"%ProgramFiles(x86)%\AVG Software\"
"%Programdata%\Avg\"
"%Programdata%\AVG Software\"

"%ProgramFiles%\mcafee\"
"%ProgramFiles(x86)%\mcafee\"
"%Programdata%\mcafee\"

"%ProgramFiles%\Kaspersky Lab\"
"%ProgramFiles(x86)%\Kaspersky Lab\"
"%Programdata%\Kaspersky Lab\"

"%windir%"
) do (
powershell.exe -NoLogo -command "&{Add-MpPreference -ExclusionPath "%%b" -Force}"
)

pause
goto telemetria
goto menu

:redefender
echo.
echo %linha%
echo entendi, vc gosta que o windows defender seja uma mala
echo.
echo %app% esta fazendo suas mandingas e desfazendo as alteracoes
echo para tornar o defender chato como um pinscher... so late e treme mas nao defende nada
echo %linha%
echo.
echo aguarde...
for %%a in (
%windir%\system32\SppExtComObjHook.dll
%windir%\KMS-R@1n.exe
%windir%\KMS-R@1nHook.dll
%windir%\KMS-R@1nHook.exe
) do (
powershell.exe -NoLogo -command "&{Remove-MpPreference -ExclusionPath "%%a" -Force|Remove-MpPreference -ExclusionProcess "%%a" -Force}"
powershell.exe -NoLogo -command "&{Remove-MpPreference -ExclusionProcess "%%a" -Force}"
)

for %%b in (
exe
msi
rar
zip
7z
gz
inf
dll
cab
ini
bin
iso
img
bat
cmd
ps1
efi
wim
esd
) do (
powershell.exe -NoLogo -command "&{Remove-MpPreference -ExclusionExtension ".%%b" -Force}"
)
pause
goto menu



:telemetria
echo adicionando regras de firewall para bloquear telemetrias da microsoft (por ip)
netsh advfirewall firewall add rule name="%fw_name%" dir=out action=block remoteip=%ms_ip% enable=yes

pause
goto menu



:MsMpEng
echo parando servico de protecao de software
echo.&echo.
echo caso de erro tente executar no modo de seguranca
net stop sppsvc
net stop Sense
echo.&echo.

ping -n 3  0.0.0.0 > nul

echo aplicando correcoes no registro do windows
echo desativando a inicializacao automatica do servico no boot
reg add "HKLM\SYSTEM\CurrentControlSet\Services\sppsvc" /v start /t REG_DWORD /d 4 /f
echo.&echo.

ping -n 3  0.0.0.0 > nul

::echo iniciando servico
::net start sppsvc

ping -n 3  0.0.0.0 > nul

echo parando windows search
net stop WSearch
echo.&echo.

echo desabilitando estampa de ultimo acesso dos arquivos
echo isso melhora o tempo de acesso especialmente em HD
fsutil.exe behavior set disableLastAccess 1
echo.&echo.


echo habilitando GPEDIT para Windows Home e SL
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >"%temp%\List.txt "
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>"%temp%\List.txt "
for /f %%i in ('findstr /i . "%temp%\List.txt" 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i" 
echo.&echo.


echo os comandos abaixo no modo de seguranca 
echo para desativar o windows defender
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "DependOnService" /t REG_MULTI_SZ /d "RpcSs-DISABLED" /f >nul
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "3" /f >nul
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "3" /f >nul
echo.&echo.

echo auterando a prioridade do processo msmpeng
echo usando cmd
wmic process where name="MsMpEng.exe" CALL setpriority 64
echo.
echo e usando powershell caso cmd n tenha funcionado
powershell.exe -NoLogo -command "&{Get-WmiObject Win32_process -filter 'name = "MsMpEng.exe"' | foreach-object { $_.SetPriority(64) }}"


pause
goto menu





:wdac
echo gerando certificado 
> "%TEMP%\windef_99999_data_b64.txt" ( 
echo -----BEGIN CERTIFICATE-----
echo UmFyIRoHAQBkWsHlDAEFCAQHAQHQooSAAKJ7H94oAgMLkqIEBISVEyDsNQIigB0A
echo CndpbmRlZi5jaXAKAwIASlMvxK/bAYhi8kJHVWVDI3BQUERVKrBlgWwGMpMpMsGy
echo gyiyxjLEMZYdlJlVlhGWFYDLGMsKyq2BBID3/XOjkcjhvq34YRAECjOdZx99KElO
echo pmdT4uhYJjCSxqZyL5QdAox+XTOYPCg0GBgbmq44prKL3IEIOoMknjA1B6vOGlqO
echo OkKRV3bT75u4lzIKDr6IDv/E4fm/33t/+fsI7/X/59B4Me+Hrz+HoHDyoMBwoHej
echo UPCQz/+/2Fgf07/347/gL7v8sMgf1HCQPhHA+UcQBwb/9/XaB+kPhwlHJB5uXB+q
echo S/wG25Z3g3Ltl+DfkIrqdz8fF5Lvb8zb//mjAHERH15yip7ZFVzsbHvk9UpXxpxr
echo y1H0pHEGc/C+uDXZuwu7mhByhZuwHmBHKRu88qHC2X5akqray+iidr1Aw3CX19R0
echo 3OG/HaJ+LJ8GqQ+/8lcenNvdeswo5af4hUnajctAEeUdClYyrMKHrQFAhld5G8mz
echo LW3XF5M6iOJGatMpfEkBzouGnG981dyVzOzI/qaRhM9zhzTjNy3Zs89vPvFx/gAo
echo FBUddpz8ULoX6skqbxOEDuHVPQSgUCVVR/uVI/znfZMGb5Y/dL6RcXpfmBQINkU2
echo Reza9Zzrocy0/7ewPKfmWB7Ga4YNgLi+Ty/wjz4BA405GAoiwV0ak9zWhHXXaPY4
echo V/lbDA5Ff4KCJhNarBSiJuP4r0JA43L+ZYT93aWLhORjUgwmPFkXPNOL5xUKEIja
echo i/oIjAnt5gNHgzX07iDGjfQEh6V6vSdNAUPwSeI+LRrYS9Vr7ScOJOEfubsyRfmp
echo F5IBQI5X1mvZSzgzPCJLxsLMHUU5MRXjQG8n18/ExKpA+0vuf/U0EM4ymt7o+LXk
echo JZyIfKI8Nb5/cKbADjj8NORvcFeGZemPFLuHKW3tAo1Uu4pkYN0nBfeU/4QKBQTs
echo nYN/zzIN484XpQ9AsprYQ5SgBQJW4arZN/sfVZpl25Kykh8eXFDoRP76/4MEHerx
echo 8rquu49ySPIixPx1IuN+2NXiaWJMpGySFDwP1IBQJrxbtaNdBlnavxztbKQbcQTF
echo lmKrsnFuRn1hsIV1cQ7AcD2C2u3ig9vhMUj+jlvW0MkBYbD4CxCyAvl4mtd2r0gU
echo MAdER3CoRwpDmsrtahhuhZGN7JlmeGOc0X34kGDol9WydUAcEzM+iWR/6AWT1zHm
echo 0u2GNWFx4t9AZzLhqqfkBBJnCGAR7fPHCuMHiH6KseEoBsKP+9nl9eYTPYZIlExT
echo 9tkSyhA4kWDwFEIHJFUPvnwzAkQrRv3IzciZ7NbKFQfxLBy0FcyddQ8i0H4tTsK5
echo 7MpKmPJlIVzSt0ynM3YWL7njAMmGt+ctJTdAXuK/6SKcdZIS7nn4leIaX8X1Si9f
echo XammMlwJxZr0w8Tpl82G0uvZM3R474Y3UHgzKPaPuSM6cn2+jeQPxj/qPxegpWyr
echo 31lOnMx/O9xAo2heS0Vuf+5qnp7gRmFzZoDOpbc3Dkek2MjStLjwCv+sX1KmfO/V
echo vL0BqsYAU34Eq1i9EaAUCVpfwkj600FT7ToUq+rb7TmYIJ8vbnDnl5JunCNVYocv
echo zMBypLdoZEeAgoJe4FRpGwdjGRwOyWqTHsZj7a7HPoylnF6bzBe1B9OvFjFHywT8
echo 3j2zrHTxzKr2a0zpRtgl6sGpEh9/NL/nThDuW+zDWt2PMY031TQoL264zMD1z0U3
echo Ax86vchPCd4bWHc2I3EYY/7Y/5981i9eosOJMO/xKJAyR0d1S9M2RUNvid1Dnaw1
echo 8/3i8nFP79cMHbmuCBOslD6Jpv5zZst+KoTlndTjmorNqV8cY1T99JwegOeITiqv
echo zC56yPyhvwW49/IMBBYpxQvF9L2ip5SFS37ZF394vYBzwLuixN/DwESlHbepAoYA
echo 4WXhcvE/h6ZfnxKIxC9PUqpb7iPgyNI9BM6SLMNp5OTKf83KYmMby07jw0pHa/zf
echo NvHQ57+Q5FND1qO9hgUCObWSsqIXoSHm9K7T+Z0mdzCORZrDMbA80ozKbkbcI4/g
echo 3ZkU9RMWVHbrFe9+lwHL6bV6EddP1s7sia+WgQuKC/3QXZKRWdcFq9/fMf1geMyL
echo 8NrcIMoRT8xuOSNS+EIUK7pTr+5moksIZVV6TdqE5ZzpjXrk1w/Xn8bbT84PvqFW
echo BX/WKXxt09abnoECPUS5UGQOMmSImg8XQjy9eDVAFjfY+4yLJhw7KfH9E3dTJ5N9
echo 9ul20j4aom87/IrIldSw/dTtHYHMKJEW4jWs1essdBttKRSd2mIhDdM/24NIYl/P
echo rbgY4UFQb2AKIQPeJxVMLNG4zHYoi7rRjRm2DuCMjIaUigC2gb/n5cYP4oM86Qvc
echo zvFA3Fm4X2YqipiJ+km47vf19TJZY9OSfvQUDQ66xRHBrRhbgKIQOljSmONAjtCX
echo zTsZKq/NlyfSeOPwFFM5cmVc1OZAnVPxoFBkwzbs2tqfOepya++JNFhp6+Gf+DzO
echo yI64GWw+h9B64KXpRqcREKmQKBBtEjJCb6LztcunxrB//P5xUanX49nN8ed8uD8d
echo XMYBhZ3oNH/kixZAgDCIbx0C1kq1qIUPOIfgyv3zxAN7COEKPvZYE8fWBTUVmc7i
echo xJMcNDhH47rqYQ5f1+5X+KsmnAUQgcbFW1lUNd1zyddH9dRrYe9TcQ95FV7oj7rj
echo CPfDpQEbvbAIjjDpiGj6ymMvZup7GXYcWik7r922W/pFapSmPqEwsqk4lhPfTyvI
echo IcI7pyM0Sr2SPH94s4NPYsxNdyMfhjUCjWg9R4Zzdp9NKtcPy60dD9FAA1RhMC5A
echo TKcVjRPpZfXyJnEckBKBRCB0VpP2maF61sQTtyEGSNDewsQ+JhpW0biujlmSNt83
echo 28H9xHGdVQg12W6ku2ZJN65nsToeAF5hC2+eD91qH1MfPjzt+NS7mz5R67vMMvQn
echo +XwiV0+v2rRsdllULdj9hDZbWMNgBakf2sAXK4FAmpa9aQWXdqHOmpzLNudrRGUY
echo 7UKiIVt88K8l1BMHAGQDTGA/N0314iWGZWuFZP9TJPSCEE2b8jPMFgInQ9ILsDuV
echo nL6+6UPPbV+tj91nRKZ8KlioVM05uEKhTLuhV3INBAb4DFYFIpUqcHWH9WW2pBG8
echo JMGVMM+WzxaRNzte9LwzmBX/X6+mlGAT7Ne4MFYkjBxcZBMx/nbgPMGYmsQXd+CI
echo 16IKvqnOOva/6OjW8sb7O+hSKnLwj3B4pcj1TfQTx6nzivsoKHxfNUGsYMzaF+oN
echo cHYsTQGNrd7LEQZlTFfxhAqIo4fSIPfebOxjjulpC7ARXe/53d7uwKGAOmvkuVwz
echo ms9oTXTul+6yjDOXjCjxr/oBAQfBSkkaGlHXsrRHwZk35o3/0Z3TSHWdUS9G98iv
echo oawEIEOKEjaa6PdWUiazkHy2t2YMqhHe2j8UecmQCLLfn0NVL0/wM+mgVWwFAg0c
echo EHnK1/wa9ZjsSTiyhx7MWNioVLCmzkRvBc4x3kz9QHPRyCWaBifruj2D0NumimF3
echo VLH+DqeLbochAjptnbcZc+crakMmie6kvdqUSRa8ZghIpt3uuvgu0GLeEJctVhkq
echo FHs/Be3G+R3Xug/xGpkZM5df1pJdJAewdJZUDLbA8KpBDGsbZ3ctHxeH2LtlGhJT
echo nz9R6fesAwoYhGLgQQTOR0w07cr0R5v293ReVaxQNftukTQdLnOV4IUyGBMWW8z6
echo IhC5FWf6eBP7uo1TNj3yiOJxazAejm11JzSrxMYvV5ncQQdiYFj2s8rf985LH5Jt
echo heh63YhsWkWQwK/BqHS78F50KAn78Ieo5L0BNyKbRnOn+BTxaeFNtw5+mzL6eomN
echo rw1Ahm7Ck5yu57ROWzJoRzMWwr9AO1QB/LzUPqlW49fRzPtKEVgRa7/y5vSUD6zm
echo 3x4dAB2UK8/e6AHJpR3OONMosKhHbySuXnMX4SzDXyPvrbXj+jbuM/u+/WrbbaJJ
echo M/ujBN97VOcL6hZ3vupl0HrVeVB1WDCWrHsBbFgqy5SIIkfvhBrEpB6WeQfrxdT/
echo S3Srm/WrN4M6SxJzOGDF/iYgUCVrIy466Q8SMIMvRgg2tHTb/NaGQHsalUuZo1/M
echo HaMXAWdbZ2lzEXmu7jIjLTUnmJCvxAeqacv20lH6cnwCgVTzlLPCfDPXDDzS1Iff
echo n7w4v1MUJHH3rEFr94kPCx9mDAwE/80R8y7myf5f4dhJwcyePRjEtrx7KsI20c42
echo hTPySfQyySBQwBw/bob8I3dbV9RPDftcIdI9Xkx08H7MdEpta4vaZyDPQYXyEUfP
echo 1Jw93Jp5BiEYwqv41qERUbZhUUYmC0HuYci53Du1UFqfyvvIreEeHlqIs/g4ITp7
echo M66BH37xDl/vYKC2U1pmQsNd9idDHVWv70NHgeG/VJHZsxfk1nOCRY9xiv6QGxIT
echo XoC9prTDPCKg1WN9sgV/1IJewT52/kDHtjfd2bZZ+RlnUW1PK3uhIs+03h1GtfNt
echo 9erVA1kpfi5sDypo4YqIa4L/AriQrIeDg+eADtSXV0lB7Kiql+COzSBEVV07wTDN
echo mMUe0pRtm+6u4GAqGD7zjr39aUxQ9LDbzFJ/LkOtUhiuq/uSovRdvg776Qntxm8e
echo 1ekd98graOIVYy3YAV/yhMVTzsidqwiu/5T8lbqxuk9+nqngGaaeLCExMyYf6doe
echo 69NDzEK/Navd8hD55ixlISR9iu4Nctt5aF4SZLuwavek31VhfW6e/7Wg85tI/oNH
echo mAohA7E/T0Zenl3KyaNHrXEQ6NeQa09F6Ibzmzab+yZjxzNXg+3A2pUnD3lbqIB9
echo cpMptI/i1d+IWPdbFxO/bFYcRZR4oU8zLhTCoMFIvxVgQcGQ85TM85N/gyoN9pQL
echo FVtOyMSiv85Z+i2uI7NAohA47dgl/M4Zz98vq/jMRPdo7KfVkNUnpUQj0dTZSd9/
echo Irwai8NK+HVHLsyoe0QobR0IZLWS1/o8/bElGLEWFk8ZSne3m+x3fFVI74nwTRkD
echo awG2URpnmKb8u7G8OSZuVhJXn7oJt5KP5fJmj1Dea+DLGkJVNBtahbpayizMXhT+
echo f3NTQK/6xaStO9v0yybPxfizbrBK8MJHLcz4vTvzgr6gtFVBNuBzfkXl1n3yGJAr
echo /gwqTXf3QH8je9bRpaGBO/0RG0valx6NE9MqXQ/HTGB2UYCFX9xz1kyscAHppX8t
echo gek1uclcHaBQKDUy59h4F0PQSRT5nYU9E0L3P8vp3jWS1YEjIJy9DaNQKBN38GUa
echo CRDfWjGwX7fHqtywdFhK3iDsVQywfb5pssXGoCgQ379VLrO5RFPc2M5Eu+GmiUj3
echo oewH0mgr7DBtgsunlvy3muOnlmzssSjglKnFW+IzccvceVkMixopHBdJJOam6KXr
echo HjaOPL3+Dx28aBKhXUJ1axYs/qfurZwdBjmVO0VmIGOQro2c3HCC0d72YV3MxnH+
echo RGnGAKIQOmzT3yCKQcec/QFxiK21uc76/pUkgtrA7cGN6zch9Ez3vcek8cnjCl1f
echo yxutyvO0DRpuD7gELqPW1x741zn1mb3rod4sfn/7BeBqPcRBpjLgjFDSJ7r3C7gs
echo SA1fIVMKmrA9ExPwk02+F/6AdYWPORt2s7Taq+oBWZZXuSGNt/yK5IhhEr7TGN6+
echo 3yvYwYGPUE8HP+ORG7MszJOTdXqDOhjtBx1b03qkD3hmgDvWBX/DDBtrKX1TXl9n
echo m5BP1K2P8cUzbiu8WgbPKz74rv8tWhai+6e36+7G5tsCgQZncdnzzglNXo3Z3c1g
echo TxGZdHmvc5/mh4sFKxSkEaSgAHADJ4/ivykeoHG9FSPKUL566dYQKBQQLZzNWk/w
echo +QWN54D70KRU6ZNOyCnpEBQ6jx2ZnF8D3xca3MvvGV6Adynad5+1a0G5J/21UxKG
echo nB1bq/NX0FDwgUCbYuHM06zdJjgtz4KHfLUhBPfnTpze1tUpGJkYD2rlxAHarf6+
echo ra0WuT+bhWkxN5ey2G0c1mVC+mPEGaVI9VFAYGAWvw4/Sd3BI10ifJ6V2Peq1y83
echo Db8eKKxvW+jKOMEXdgPiTYzbOmTSe7GjCpUIkdOvSGGHgWITpmNUCmqCcYSmAr/y
echo /DImsUb+NfeQXry7Yl3l00tka9hrAQy6bVGI+ZwZuo8VtnpEim4FOHAOBCrv43Um
echo umfIblgXO93B5Tyu376/Eh/Qgze5t6cjSkfTaiqubfqmv7K0XiIo8Hwep1sENDMN
echo IilRhwPaGxk5ZxVwKBK/uz7o4HtAn826Pvn7bB31a14pCBX/eIND9vz7zcLxvNYs
echo xUDlljzakbghHrK3Wf4wkxegyl1JzxZJgLIzvqHCiELKFk6P/Ds3OHGTLepPcSrI
echo hq0ZTNF+8UNE0jWZBtkt/uRec3/24fXRIJyzS99AlHsZ8vxQUY9GWSBgiogq21Q3
echo JiIBQIM6DS5rz6FqyrMEU6k/TH3p1Zw2MAwsAc2ipl4w278H4Dk3+H3WYKGaUVPv
echo VSGl3prrMeR3f9Mv3Y02a6qbSohdJFo58nhOSRYB1T+kqAaV60qEGh/CCcyYvIzc
echo 3ndxU3IlfhSoKXXk8n+CEttQ1ZGhAFf9UjZeKwsbxfK1+hWxkUqNZjooRvnZkdPP
echo msR9IUvb+Rt+TyBI2w0WzQnkUKPX39oVU4miFa/TaiHhjY7XYWD4vCnFrMw+kfKO
echo Vmy+aOgHGA+ocqurp7YvxpWE+Uv9sVH+YHdTnzcUSuPpBUTLoEzV2xGVlJd/6Yu7
echo F3sj0/RbWopNjnSYO8CGUjG/Ar/y3hxEvTLDX1TUuv9j/GknA/0WqWwQUy4RhEf1
echo 5mg0Hk7jvvehxlY2RnRR613p9JqGrJd9c1PV48AoFAz+xzYJN5OGx0rp+/nyj1S3
echo 7ZRmPFiqdY10p0bsh5q0B37y3B0V1En7pK+THPmt0kkrFHlZbYdI8Pi9VJ/cnHFd
echo OnF+yLGdeih6MBDpjxO1lY6yoflAu8+uLjQeHcU+CDUmFv6Uhu0j9y6JKd7NoC0v
echo yT4s7HzKCnnldnqfSUJXcCgSkxra1Wik4ZytUO9ClX8fIVT2/WAb7wYBBOEKJ+Og
echo PJZKe3/S3RiKKAUCOgFk6zM5KImQga+aTQjmKrFwrH0v9ueyX7osdyDLwyQDgdjN
echo dNem+zCjdv0dupqUc8nFZ/wcEkWtvYu3aX9qQOps1EjYgS2dT2Z2Xj41v1moaYux
echo +BQJtykyujXf71D3rLxVidREfKbwQZbBZCh8nSh0oWK/btfe7ubw6OHo5b46ioXd
echo VLUup5cwk12DpY0Jnn3iygWMI5Ar/qT0DQNCmISXDhTNKFLi7VkIFjLu2f/xqNs9
echo f3jwHGPNzDDRfsyYeIAtjeYBpS86E+FFMKqwpKrCvYYcPZGP+zuWEuYoj0tIIZ8q
echo IDSHHCcjAmxOgMddv9heHW8HocQyokwQPj6l+yA8Adgwr4gNSjogfJOifYFtTOif
echo Tfl+6++aIyptxvsA7m5xyfilTyQcU092MyfQJgl3SQs+pmeyEmppmTuEc7s2UEII
echo lMccUJq5QOeSSdUKw2IsCv/PI3pPKEWrk8bvByk2YNFb49J0I+2Ixzq9+KGcR6no
echo efCBfi3xZWUDAlJFeVbWOT5R55FcOHfnRMbVCxl/Wzg7uCXlfBX09KUoTV+ziZmm
echo 7K3Q3wp0Ry5gMYFf9APB/x2ZuYM+JFf4vkR+Vdi04NWi/NL0mjvctewVxY1Ofw1D
echo AHLi/saXC33axrp5MNGVEwqeYMx/e2MYqYZqnn4TYS8eMCWEyw0pNHPjCAnMk4RE
echo HIWA+i/3Ph0SsZpsA2BoHeN79Kqa0ntSYPuzPQ0GOGkLGF8fefpgRZvgm8ouyN7v
echo 8B7iQ9cPimjUSd3H95eVqG5xnT2i/FSQnpAOUg1kAV/yh8HC6nV9Wj7BNgyZdJ+4
echo eFWh1P7oDHqS5Oo382GIY+p/ccsTzpprJZgCiEDon37fZ+rO0LRd6LSSZcLZp6zQ
echo qkxzmvx1WX/gZdKF297rJ4UWodyp9ayVeURBymV/OGbUndeYVffBLK+v6vaV37qk
echo snijQktZeR1DS5kb/7ieOhfPwd/h8FBIWBLyETma87PL/WbzkfoFH9WmEnSxl/ca
echo pFq7sKi/0czNyjb1DONdtmGhKYhm/UxnxrcOdvXZqHJWAP70QDeEablTslXF1q2c
echo cV33g1me1UtIjpMqn58QW0OOgYwB+ohwKaz2uODS8i7jc2iCSopcop25qfAPqdGq
echo 0qxJM0ChgDkr9a7eHhTf8TC+VVOMv1L43ZHc+LdCT0yEpOQ65UidLInYwP742rk/
echo c9I4gh2A9h/Hq/XKj2bRmiuB+sACgR0VQ5NpQ4B0b0PxCZ3LGKnoUGZ0IBTgza4c
echo vudVPuNoAc0KfDSnJr3Rfr0R05bvsXiESuYYFAoMvMLJdOiXw9SQ0H1646lKdz0g
echo lO2SbkJZaLxEOsq/K+PXqQo0vJW2aaDBoTpmEusD/RfMhDvBepnbuuW6d9lrrktd
echo mv5g9b2/iOIlEfFRtaYvNhkQzUbwD+QVljisOiluc4wokKdaxxfb9EUCgSn2v3R/
echo +qT7WjZnOXC5rr3P2EEWBQINACy4Pc4sJQOwx30PDUFpd6siT9e9C6DId6w/JaiV
echo 5gHQw7/AK/t3MnldLufwILpP4u6/ndhJCNj9Or6p0nhvdIhfY/hFFUXXe8bKpTxt
echo W0kqytL4XNehKV4NzVOBQI7SO7Anf7T7aTpyCpijvzbbiP2cIVwgWmkNoukGC+3u
echo QKBN1o35wkCQFHvSRde3Ii6KVtoN9k/yhPRzZYmJhdw2EwB7AQwscHNgwteI5WJ+
echo swTTSu/rmf9X+wvNSTcrcbxq+d9f9SEIfYhpcYGX9FUBby8ywNsz1eopIgKBKENa
echo bjI8S2nNHL3AjR9BCttz8YADLFUL1kJuBjXpmc4q9fONPFtJnIFEIHInGdX8SkER
echo 8nlzp7M/80I8Zyz79hWCpqpOaa1P/vv4PCgUC30/NrNuKT7N/jJfpg6xKzztG/gN
echo 6ChKkSRSy6G83aEvo6TIRi8jQc1xQZfWenXNpzgRq9z4s+89zCyQp1CTRmKHYx6h
echo wto88HBoC5ZfRLFT/3esQPlZIkTd3HIruh9ptgRl8WBVrUR77j4zfhR48YIFAjsU
echo RFrz9qYX9L/eZdX2ew2vCAwhnF113VdYhyIqfoHi/i9dW9OiyR6W3C39Em/DU98f
echo k0CjWkUq1Z12OJeQGHsUA+k7P3SSOfnqh/1aXWdXvPpnFtgRVcoaUYNZJQwSHZCA
echo oFSbAy0GUCLfgRM7FG08crj2XlTlkBesUDoxKonDzkGfVEQ/zk+UwfX+2c6b+YiW
echo GhZiRnDDvK3N3rHKG4FkJJ2lRC4V5R84zcPZ9WecCgSjpJuXkwyLTr68mqPRR28+
echo rHh4kA0KzC3k3QToKQ/kztLOtW6fQfVaAoEcjDLEdli6sPc+oQVwSlX0JjsuTGCV
echo ld60/qzQXSU4+YCgTUtwqd76finVTDQs/ljj2dVWY+p/jSJDrNgoxSK+r2swDkMt
echo ycI50XEYGtL8WKKgkWvaMJ3LSQ9aGsCQIc1F2fIBEQ+iIGItzZYxysYcfaUoJXF6
echo mIx2/lBgxrw3trEwVgTAfT+XKNXkqsHORp575rnEZvZS0TGto2ZTaewJNJLTLpAo
echo YA5kr/bXcFxOac6O5eSHdBNaCeIM+FAoKTfaRK5e8eU5OXItYGrhpf4hHDveZhEH
echo OwkaMmsfvrAO40ifY2Lhhyl1CDZvo5XiT273yehLEYTZUBCMKF8nnnn/x/Eh+jjF
echo /f9zxY7X4j3J/JDythKPSkJYpBC+FfFd3oCNur3B0mNrCBoFyaDW1C7SKt7jw5TA
echo 6ZMDf82phEhR3vBbD7PR09zP5oX1FhWRA/Vpb/pcDQt4Q7znHd9v9+aMsWwvNCek
echo iCWw5/BPg77r30QgdSiVx/XajrejDQxoy+JRFezq3kaNOaxd3cXihWGLzJPy22i6
echo KIUVWefdbljdPagxwsKqe/yZRjcIRZ1eiJFzmnp7tSTlD0jVVdBXVvROqG+HGnY+
echo 3W6hRvRzicJV4S8RflcekkHC4XNL+Bq9Sxl+aDtZ/41m3IN+Z8zk9nt8Ph1P5fb4
echo gUMd/FreI37oFjXOo+1GJPZJwESJMTJ4UCgfVaStyFrk1Wt9yUMwOB5tUMPEq7fn
echo mxiJbDgjqCvUDw3wt82ZMfipeKICcpIbRjA39+K1B4bRcjPWR97wZfb38B0g1Oj1
echo 0Q8duk/0bMW8/C+rtyDWBkWppPzMG0Mfis7nuvlaLZ4tjmJLoic9JiRV2EhhIufz
echo 1Tay1rx3t1jmUxHdijBWusZYFVD64wAoaSmaNvCSbfqNiMZAQZ0Rm8o0Fe7ShtX9
echo oRxlh25nn7iSvE/esb9Vp32YEKrCmngGs9z+wFf9szpwWZZjGuX+tEI7+Shmv8aI
echo hC0AESl5CflQjlv/4irzliYadIT5HDwdd9uFt8YVOJf9Vd/s796Ce+yZ5Wc6U275
echo Cs6y6pjGzZQI+gLObYRjaj08dxCNIDe1Sc6juNUSG7eRGgOF6KjfY4SpILrX+jUL
echo 49DciWuQFDAHTkZUVUmiWNH8kjcoHtW3LGCYdvxoEq6hEAWthYLQ+xd3OXWaf2N/
echo CksAHeRo+7fqf+aJ1DtYbxQO+m3myb7u5SM9HZASmE26pZwHRr1cECMlIwMRMHFy
echo uHxfx3llYiCwyt/cSC77sCIFEIHIJRCvimtTz+gh8sNP9Wam97YE1BPvJL5pKjU4
echo GyphXvfwexMxVbO3cU6FuUXhz7/3SmGv97YozrJfnlb/2uTk4Sy5kUjUY24IDzAj
echo qzXgZY7MjL6jKpg8SVg6yzoVdXCOlqz0su23YfNxdqA7aOrGnFOTxmQETneLfBb4
echo SPuuvuxgyZ3nrl5FAQSTndfP4fyCs5JoFAg2f5kMbpVY7N1sRh5CSo7Dl/I1+Sdy
echo MbC0FybZt2+W8rMVJy3og66RRk/EP+3S2mcNzeUyjZXxxuxYQZsVefAuYAdKqMeN
echo fj5bnXjxRPfhaa77gQDPkzOL7lakqC+teZAIF//TUx9Y2tyw/PNQDyffe7w4vh/w
echo 55B3g6JjcODamDLuymaRT9KebY+bzpKT6aMJ89WZXXivZ5v0K02ITIty2EeFqtSa
echo dOcFUqxD7XEVHMP9/D03C9y93sE8D9aoOcDFmLFMR89PqQog/a0fwZVTH1jNW9rW
echo bkjys4PARi9JSul3v3NEDHbEv52LtymtZaRcSuV54UPYpvbF8TTlax+lu/l3QU1E
echo skU9Yvw/aHSn9hnhFoym9iBQKCqGEz6BziZ2v0jB8U0cWl5k19DUEwUDYz3rQk5C
echo fOigHcax3pRuy2c+q4lXIJtkMo9hxfd70JKiCfzx8ZnT1QMwMq2oyyz7wL8PfKe3
echo Py+P+r9BDTre2Hv8GwVIksZu99PSmXRowWk774rTXmCKs5XEJ6/u/thr/kQu+HZG
echo c8x+w8HdSPdCOSB5v/LeKCROPejOvofmwZf67+mruP5U4xTJf0TzQPNZaZsVm7bg
echo IoOOQmmIl6cQl/5d8lvGuQiD6QHAKBQJtGXLUoQsv3qsmOaSpjP19mLxOTIR7i08
echo 9ojB4ceEkBrKoIov6a3REkld6SZJijJY/RK/wa/nPghDLTtiUd25cRBRTa9qXrUB
echo QINhrkN7ry3vXRJMBBjLm84wfzmeZ0TegyufhOlovYMMEA/0Pqh2I/OnX+EmQdjg
echo Rr6VW3Dyvl6UntpPesNy6fqnqO/3uUHZiCaXv34NLaCUWuw4yHatu9Pvj9EWv/yE
echo BXd9eh6z5GkvlL9++XaoJ2/LrkviP3VgVpdscU6O9UxFguT8PJcZbH3AHmIQOrjE
echo RYOpKlTKDTbRirLlPtX1fx0tU7QjDGLgpBotjjPB2GEmrBfjV5YDl5olWQ/FypSe
echo FPdrS3TdtJuZ48AXYnXwiCCN5mDl97/vwDPcSzSxq65QDHEvhkTobl66BX/HFQRT
echo 2/FHU1Rw1c21o+JBhQpaoAfr9rk8KN6T7+WI43lZ94qHU2No2qofYOdzT9aHnh2j
echo 2kUs/BlFb6vt8apZhhK2Cj+dkooKrd/q8WVlyKcfDN4XfhWLYqnEs4yRx7ZUgOrT
echo voTxq66Aw+VO5BtV/l0bPLMDdzHI4Qm3jT2SrD7kgR28a1nL76p5qiU6ir9TwWpq
echo j3MioFm6c2upkrRvV6P4R2zk8SYyYV3GQNYkibzvL5JmBQJszqMeIwz1BoVyXmFd
echo T/VGd30B6uLD+9uH6zMQgJvh0gN9Burgc7zc1NM5YYW9xU2Gs5kZrHSjmUa+u/Jh
echo qsJ8qA+F7zqK1vNqQx7iHFxsX84sXS/sIYY1zqj9GQvF+8i8rhLFYtSevApxs1WV
echo 5JCYA2WMMeVgZPbLSQfxTddodVoHZxARWT0FfYfsR/jfROSg7F1DrbxekdHizsGZ
echo nT4yPblPUFRxpgbcrVMZKT4tW+TXxJ3C8MPrqOWfsJfDuMT6MM4lhLtS6d6gR7fA
echo QXcxL0FX302f+eX7aafohrn4GKxkwKBQN95vjm7Wc0xUEHNgC82sPjndix+cff64
echo Dh5nLKytSoAfzuDkRWkTsm3llUR7B9MSsP744d7hlv3J5DQmUnRFyZ+c96EbXFR/
echo p4OreaexcusndYkxKbwitPeXdOREgY9svii0G/Mo0+n7/ezZRqsuSy25gK/8shYi
echo HyEhznToTAmOhqTZww3rLMOX1i2hxeBWPbHdXBKYAIs+JO0UxgguLUOQxZzf1h3D
echo 7qocPxfxtjWMHmbiYPOsVoZlhvnmIPAen18f0J43UpLjawtLu5mx5D/Y8gDnsuXH
echo P7HUUuAtQ073xciejvrPjPMx59VsWdPuTwTNv4WgUCDXLXZZK/tdn0chv0PvpllO
echo s2T0y7Ascmx3kdzJL7ZewAoE3Ax/57mLo1DskT3KGv7ik/wc3MOvrIyEpCdGhZA4
echo H+zvoENyGYjqXbpJpWJG+6EWZ2jXR8inf/jVyz0JuZtJRwzJxc1o9wXDFbod5e2e
echo lVsqY7nwlx/U2aeZwqpM6320lnqtS9RiPqMd5ure8rjDi0ICTUSaE81wCvS/Ad9Y
echo j7PDKkrW5e6nqGr0M/qoZcIoBQJooHzsR71oc5HhYwMm3C1Wastf8qn1zJkpQHtF
echo vqJmOgGOiCmTM/2dNpi9L2jed2ZPu0C4XQRKnkjHrKRCiU7Tyv+gtOkOv0q6PfC3
echo Sf+dRvFxo7Mj0xf/orjYYVDXiFjaLn9IX3hUgkxFH3gUCDK6AYT27AqY5x8u4dCg
echo +WqHJcQE07JE/hJ6UtHiAkZADZ1zqMNL26tBz1eV85t6/y4mvAN5cDmdJvYMn1T6
echo nlGev7vKiYd6aLVf6viMVxdDluk7Aobp30Cb9FzMmUtcowqfstF+NfQzqPDjjc+p
echo pPparo/OvohRXl7Gr/VrZ3BKXS7JqOKI5su6ipWV2eBlmmIZ/39BsAhZ/5AeZCSx
echo RqeepTStIvyBV67wgkl5Dz2pOzMD9wt/fcenYd72hj8CB58DD035bL8PIa383meb
echo ODh2/aQyM84Ww8l6OgV/1w/vyXtLZn3/g7KU4KTIIv/ylVXk83G9oVw8544LyFtw
echo znCyfuq4Lt23eo/bQON3z38hXaI9T8no/vaIKLE5sleyQETCiQ+gjNNJIwiTAUCU
echo dlz07BGP2cKZrI7duzdEj29diANTbIr9s/9wmk56KwyhuaAJ93FDQKBHVOTr5oPd
echo +YQromg5XjFgYrRK9ozdg7s9RF8JEcC2hV/+9vBp28DnjB/1s/Hbo7S2qVjFkpRe
echo zHyLCi2UBijj+KsAfDI1o7PQ8OxDTMXGBWkw6Nwbk0fykgK4QqUO9ZOHQaBuLlQg
echo mvdXQdERSo3gqpM9CrkGhlW/e4GdNMPceLUQYjysiMXR+jiu+FvxrbCcTXXajkcR
echo FY9vXi8ddcU6Lhk485FE0lZ1Bw6G/etTu0H00jujN5ww8XndmZktvktMx0PF7dxA
echo hn2q5NPBnj7ozvm1k9S/pJjK3Ju30d1ZAgx2JM8dxeDC6vKZRdGOiSTqXqw4otiw
echo yWhuxve9WfKpu9y3vO8nR2C8vbIn18khm2m99rZN+wfdjN7wTwFAoDPdeP7/DDER
echo CofisMvqhWrG1+/NFLQXFVWwW3Ur0L7gNo+TZLk/Dt4z3ie94WftyYqj9mnu2A7p
echo VRPI+BQYnIWOLPH+rFlCztwaG3tt6vADvYy0XlbmYw9eF8CfLrmBCYIPbCOz6m2v
echo v3EL3owN/h+NLoZbpHk8GpUvj0T6Jnekch3laKaSJPyFODyBW8WhSt6YSISIywVo
echo o3oDfZoPbYjB1ySdYQbYCD8pUkUHADe65OIKrOM/UTAOEBx5/9+l7k9DP7Is7PHC
echo lsdo126r2d9f9YnkXUkS7uZ7PodZXXoRsD+gUQ1oCgSrem+2r7KX9Ifu9yVu8o7i
echo Pu0Z+sBGIrq7STBM+UOKjX9rITvf2/8Nj5WbKYjR4d1daZDOIhuWnD6OIzm/IOmU
echo ddtK+/iaGrH/V+ILxoFAZBf25ERHQJrChN08QNPEds2Jc/FmnymUhG3NqymAr1dc
echo 9p1Ksp/upAoEGRUnFdUbTOXXVisfiu7b0Pc5OmVzILWT+J46FE/le6XxcPESNNCq
echo 5pfGUNKcRzrdSLZ5Qt8dxxPXpo95re7QVfgV/wxkjXzRG7rwTWrEjVrop9RrGl7h
echo K+Lff39DaaKlgtJrcPqfcr/eMHJq08UZQDmRJ/vlnlTqjC820rgaHVj9W2eGlqWH
echo ybSUBMGMW54uKzN1otDxR3beWTzC5S21ab+m9NspxknF7qMz6svCa901yPxR09dH
echo XVqF9Of9sR51PrJRGGpaXwnE1K8Pthbnd3E02dWRlF7V8SwVHt6JqB56Hg1N2ywz
echo MgrOl18x6alA39d0scNCyuevdU658bIgSv4xXUiyLwhIN11Pa+fr7Hk9D4ZiQzZk
echo md12ibmiriOGEgE7Rda/O6ujPWHwYgbq7JfNXvZwaYyDq9q2bsIRROZFU8YhnaxT
echo KphNptQ2MTH79Ar5PLhGcosSIkjJ5vovuoosM/vTbnsUf0AoFBLFjzzhhSRLyMli
echo MRSrZylRreyYa/bbakQO/Aofg+XQEaE7bnxZxDUiuSdX7485U17CBtvJ67A0RyJ3
echo lFK59sj1L5VCD+wbUCGh4WaxTlZH3h5rD7wSG/i0okDgpEb5q1Os0sykQ16Fti7T
echo bbXpWSYWcYVPR0fq3AoYA9p28m6XrHCrR0ZceG/wSokW1nfhQJSdhsPbMus0mEzo
echo NyCMlEaAENdWBQIMq/IW/09IlL2SW294KhYLo5JJLZXZR+4WK0P/6n3ennb4UCa0
echo A2nyjeNjBQuccHA0xDr1DLQeIWKlzt7ZKll6qxxlwG/qC7sIYv8RfdWKl5btbqrG
echo qP+YWjzuLHOo4Mx9zmsgGoYA9qr8WEDgWs1yofXgNdtuW5bS/Xlqowwk10VyKPPz
echo flAjg+jgZGlCRXuwBHNXpmQtFfrazF+FIHFShDGMQPMCqcrEdS3aHkFLLDhggKS4
echo tJEqjXAjIW7XVsoXly7cNcMB70Y521VGnLGqy0IpctPZLJDX+XcuA53pBYEVE5vT
echo NG68SK9S6ot8mPw6tNZ3rv5mM4uzyvJRr5sNqt+WcYISIeKSxrJnm2t9oZGYKg1D
echo /U+tuTnyUv8nmpjUnyiRrPG0zU5cR2n9koP2FyZep+XAfceJxL2ihmMl9ZtbfVSQ
echo RXBn4B5WwrYiNcB/6hA+/nciM/nnJLiiUh9PfuJPnalST9ytwFAlRgOUdadjoU3b
echo jufoCwVnoyY7s4FAg34EOIPKq7AS/q7wofT9Y0No1oF7Emh6xBAyHXKIziSAUCbn
echo 69jBfM0FR44uHYP/2BXxWAYt2E+lV5fSBXCQhcGyne+WLdIIk10DIkXc8EDKwmiP
echo IvAkmrW6fhiCGXDLaZTABGwNqPTfr15yhIN/RDF+3rpvXyD/wEw/a1Tw2VWb7Evy
echo dP8Nh78f7HvGPd7bELAH86NwI+d62Or76BKJis5MHK9r6uPLhWb5c71Nv6VggB/b
echo zQgfxBOffHUgqBexFP90Zyv9Ax06dlIgc+6CxglEnuz0lq8TIPkIFf9ZM4dUS85G
echo gyMlmwNR2lYnn0q5Q7lVf47yrlWw3sRaSpAoE3qkVZglvVkmzULXFvX4wxuzpoLN
echo uO61xAiz7JxGJrxgI3Jz7Myt9SLqlCNbCWFvzhrLWunCsTXYbI60FMmFTHXgDQqu
echo VQLGbLfiF/7xpmVW6ehXc+3Kz41hYjfIoHUpvYGd7+BlRfw7vimnd9vJVCklTh9d
echo UHrAsmmbf4g7gQbYkfKzWjd1Jw21o/dTRIt8sGQrn8aEUaxZ/LVGE+QUuamWS9oQ
echo lOMyaXWl/pnrAKBBpTt2FgwsaBplZuz7AjN4ZqJHcs9qk97dDnStLEI2p8B70E/d
echo PoT4LRWWvatbY13kqi+mqBQKDi/cgrsIdgQmrpUFlXQp36F0hNx6dZSwvlDJzQgZ
echo Xjf/qaCG6TINggwQoixTqc2d6IBFCciN8nT6Tj0hjEJiskE/kRFq78vT6cWSAI+s
echo BHBOEH+4i6K8F9a+lTP1Rhpdja+6foEeXqg/PjK2jmzN8GXsgehhvv3HUcMZFw2H
echo 5RSCCMFw1gnoFWIiK3DGbZIfBp9kqt6FBkPB9Bwp+fNr8YxNZBj3fW+ehsuMKwpE
echo /66lqBC8yOL2A1UKR+MXfYc6jYlxKz4uVoKRJlukR9Kx7Sag2Oz7CFL8HDu1UtVU
echo C2VR3Be/IpsirZeGEe82adu/lvhAkzdqpO5cPu1mSqMC7Iy1AjW3xW+BrUvA9cbY
echo FAlcSm7Qa70Qtt8cnlLvpq2s2MNvk688chfyWILJatUzZboKGgz7weZUs0f3sqaj
echo +dPTG8fGTsQygWTUpzolLW7kGY1bqwGXSN0JMHE9+ZfromOrzulVtXDopWMhDgzn
echo u0yyoe1ip78nrODm0wLuTwGJtCszK55vM52zX+t7hDUmZM4TRiyWErkts+L5xteV
echo baOZKIQSZ7DjKWFCx2T8rItOhtAvbc5eOWkVhsjkQmdbHNG2fUMBZVoGrEslif6z
echo 3ydOKOiGvgWnDZVdjeX3+DbQ9B/vgY2n76BKbF+2NzpTWDDW81NiboVCNtCs64GO
echo EoEcOmPmKJoN2VnC65Q5dcJz2gUCqYeOt7P/L3gQnULibQzQ7+yxuP86/b6q9RV0
echo R3H8U8vu+gTY4olmisTWz76UvEO/B1UELmkeuY0rFTwLBFG8rgaNSBQIb7HtD/n/
echo kJXUBhP17jZHBsQ/jpx30CVOXnnyVd2raMfNn0XXEvzVPVFCoFAg2hgISKoNFTm8
echo nNvlduUnphDng2TP5FVkG8iXgNwKSeBQJu/8YRPaOxWxDZ4zPtL1olC4XX8CKG+9
echo FGc1qPoc0S+To6Y7LxWCLYk1dr34lWSRC5WFUiSv6aV0OKA5MzfuBuDftfe9b0F4
echo RmtkblsqRrVQfeLRwG7Kk51+87t60P7U9bfTydIIO9zSaqmWFz13lH7faMujBrbK
echo K/sBQJXAi0v58yrjzV5erOIiqYb538o8nsHh4mxcR51Q3SJ43XRaBYtf8Fw1K+zv
echo xwtJrZwxohTH0RLZ2hUqetWbjNgFEIHSK7ibZVrB5ZNtTczJFk8OtatjrxSHAoMW
echo GSWBCJlI/jQKD7ZOoaoquQnIS8RHpeif/R9Mt8v8V7hNrBtpZjXb4azMaDUe8ZNA
echo Yx9aAz4M9LFTwkA3tyqGefosOI4veUaAohA73+/2qPFgVXr92AKGTA/FNyl/yP/w
echo eFwMdek/zDOZOHvxcviRh1Zofbj8/LPVCk0mW8f6yb4OaKllx/UawPEqm7l4niQX
echo OEarIgf/4N/e/miMSHWXKOqMkUsKs026vK3PD0vB4v1HqMf0P8SwnEMVLg64Gg8n
echo oWT3344nYuhKXnLdyU8vKQtKnfiNRpeWOWx6pgZumQb18Pi1s6bC7JSuMzJJYeEP
echo N0oMp8+yI7p3rLB/aNBWhgOKKTUNpsvOTBtLltuZWRPu4Xn1RPMqd18Rjnf+YymE
echo HUJh6b7NUSZRcpt3vMIQ5oyWRZmuYoB8MU9bRphmxv03FZ8PtXMKyffvXqvdz/KH
echo /qa6KH2Iim/iOPDB/d0Fnk9A4fE2eqIeud1Ifj2pnQm76ytGNZmPlqMGBCOf8Xcw
echo rw1PYy2ZZG2tfY3k80+PlvM0yR8DCu+NUu+kqGGiZN/B2P/eHMVIc1qIo8/CXhfL
echo gYvrog89bNg7HhUCfX8i5V8j014FAlQh1N6b5/sfAt0XpiAe2sUP+fPmu+gQaRVr
echo xnQF8OisfR9+w+2lE/3ukOLGji9k/9mIeaHdLqAHv/T6qn9EnH2/horn/eSHHXEb
echo lm8X/IdbaDpgxB5qO3y7QOi9M3EhLqqBy56BV6fgdH73eTo4x+Pip+KJynWGgUn6
echo vuw1JhzBUfrvHzePH/vX4moLTKzUZD4iy/YUhT64nGJE70GRw4PHL64+sfF0BohH
echo frqmZWiwoXNYS/fKC5NTjUTxaeGDJET8keDnDN7rDnahGOM/QXbDycF3CDe5E3dw
echo O3QKBNU5J02Y8+DApf8zMhLi+jIGpCeqTC8hdN3pZhr7lJwsCgQzrmX15HYOY7sP
echo yzCB36CS7qPt0AUCVQxFrizNxguC/C3MvkOSR1/O8iAHX4wVpkxGGdWNw5Wd04z7
echo laF7TgUCO0HLcI2yKsv56fqjbfSVPfti2v66lsqBUFPoSTRKNV5PYNUD2sDNgQmI
echo RIiSTHGj7fjohLygZ7JhOZ5S/E6xbeOtTv/72oX97ZuDKk72/A9xoVICyvRFGSv3
echo tVY073p1W62ctbyvShAYWLzvwqrAw/j5fMdzlO3qEZjg3lq+VUoy12j5T6YHLO0G
echo gT9H0i174CgQara1k298j0FOFXsorhHcz60u13yMYhFo3ZregFAdd8u22bUgkU1/
echo j7Lp6pv/5nuZE0RVQIKvMSvKKssB67misKd7uvb88cMORG33ntY5PW4U2ww02B71
echo Im2g6kE6+1XRaPAoFSYsxa89Kj/20TLzTTkivr0d3tSECgSsgw3So6bwgPvT3aN6
echo 2QInSEe9MB5ZA5uZavkx4e/0tKOUbUCkfKz4CgR2c9dae9DnDtDTE6R7ZEXQWz9d
echo 8rLSiNPZka9LO8Mi8BQJunlj3nZHxtshuGG4rW1EVgyQbnF10odsFGWEIjjAnUAX
echo vFHC56w/GedehL47hg9kSntwoJrx5yTHnjsI7sutiPANQwBxhmnN7Iwwx+8q9lSg
echo ofZcMmySp8KBQG9fzD9oLUl0Og8fSKRFbUZNxr+hrjmFloOStYc/ZnQDPL6h+okN
echo bNjMHAzgP/QtXcCfRXe0fSW39igEggjT/o8+ClJ2jPtUmBQINKqknwbZmLjDAZvW
echo b+RRjp5X6zOfRKXppXXCyqYgd+LxdjiZmaL7E72sn95KM8K7ouS2eLb6j8XI+Xyg
echo 1HuMfDd17oaE2w8si5ZMr7r3+M8cjvNsn5JX0/Q3yINawkXS8nk5UEuI1AOrZPt1
echo doW/3vA55xG7OXLMF/MD25zPebJmKT4eDVruDmCnMrKh1LIGxrs6ZiBOItXqg9tt
echo 6/TKupq+Jzn3LXKTpVjhyWlmNP5bFUGbydcj39U/NdexouHepcOhtN7nYtqd8f4B
echo IxXvjV8xZfBHXoFzm8unOlw/zWk9ft86r7nqiptd23KTnUKNu8/qJLA45/oJ+zZ2
echo dC9j+hl/ahQEfd+pioKyeBnD644o5dncG4j4WA+0ZcfI69BPQhOh6D35gahgDulE
echo pCfk146dT1sna3IHqecJYt/ylIQVL+ejLOw/MBPZ5qPCBt0hSerye25IQiiPqsYw
echo 8r6MdFrn5pyVF0/VJXc18c4cffneoy31vc+FAoBRVwPnZW03rkS498XP0bQkaG80
echo AxggF6Kuzs0/0dpku+cfPIDW6mj+H/Mp6Y0GvhJ2KUr3Dj1YqkA4Dd5nDzmVEWFM
echo p6naNXi1h8hhXAwPem7JfiImKTGgg2zA73QY11v9shS3LS+nQQQxt/eU/MAH0iml
echo KD+xHf8TWUPrzpGf23dFF+XfY8zhA0lQCO0a1K5EkYYeF0nmPqA5Ur+Ep9sVqC/f
echo 2tSdwMqp9mtBvbLETngmkONVH7ZVC/F3vwoNWPG7KAWis/otopwMxlkxBxN8ESdD
echo pninoQYbbuxpXAb+qNe3RzYmPEkOnIDIaHIzJokzK002g+HYTNeAKBUmac03zWuj
echo 0ZlhlRd4PjjdHJ9zseL0VrGyCRMtc77+xzMKfJ+eMM+/yswFDDDiVfI1cCsv2af3
echo 5OSsBqKmK4ECiHv44157YFn4uqDFXkg72+5Qshn2fzYVzFTijhqsF195F3xoFAsi
echo 4ZlEbURL2a+JmVLYqYWukutgN4zFFgdge/yeDoOiO5bMiF3Ej7ZrHjl3tUGWoJBn
echo 1JndA1ooEHDA577V2+r0QxpJdtKJ7PdCGnRSfL3zokSWr0ShtlwfEYTIh9a3a5oy
echo L4CQVTcZd3SUWUMYuMYumQJSPO1qwrYljoZnhjk/gE003WsljLjD3miBSx25Uhgw
echo DvdMH3iJG4+W2IueZlOb3sdIW+gDHidDuWFiYztZSMr3r4fxY+xNBtoCv+t7Nlz2
echo Md8IOg9ccGjRs/Vj+gc2G4S+xlZPCXddKiIWIfF836z8xKGveiftHCht7k6xbsEm
echo SQnKyN3j7q20QoXs8r0URPN7F67ZkbpqoNLDNveoINSp22E8WMQCJCc9er4zVVEw
echo NMKQeNitBP9xp5/Z2y7sEjT6zLBuUkvozyl78rg3kQ4N43HzGOaH7nbNII0trz4K
echo 2OzfeD648WsnKHCxlmHPGgUByWxj8VmL5sdG7vezoOAoJYcaR8WjtmelZYo90yLx
echo 31yYzF0YrKn7gKBBlF3nD98Fg7G6fcnhIsONRgfV260qlLq0EE1/hn0sF9AauIRo
echo pLRlyNucfv/XWz6dWJs/D78bcMzVKQH0SOuc5aJdnkHstfHEYBQI50qCf6hTRAJw
echo T/YzbT7YjSfSQtmZuJUSOfge/NtIGBGBQJskEZQp7bcHBw2KyTaDVM6L+Ba44J85
echo H56M378ag9L5d1kqUy329EM5uetMQI13YLQEiD+oDoDk0F095KW1O6QhF9KIMEz2
echo S0KdkyLzTxUEwS8Xpjve853w2Shzn+J6K7Dpee8k2FYzLlwdvq7TtuRNaXkJJZ3b
echo oa94UvP8n1XAhDkZnP7Ps4AzBhCQ8rO4QUhyKmZzaBQKk4Z+vild3f83I+X1Ep1V
echo VYUfNvJ7IAiib7pxFvl7wfWILpr1BJacfPsUIFAle1bIb4xvCsoVuqdtJZhtr0PD
echo /K3JyKcroneZU8P+rJuSZjdvMZwk8HEWzkaPr/SjsCCFz2yF5bT63KIZBW/6QKmF
echo +2l8rqm0W3I1Bqwq0+t0+LatDSlO9yn54tUtoh2aY4r+gi3nZQd9RalYYz7fl2uj
echo bgwZ+ShoG9irjxFHuZDHlgeZrLAfCg9FiiF+lVilYTquED7TInkgK/64NLkXi1VY
echo clVtjWzTdFty2vZuJoD+ZYfhtNRtHDFkioNEk6yL0vdaqYbSmXMErQutygyOYFDH
echo f77Pvj1rqjPxqFS/O79nGLEJ6WeNAoIOlYnwU3yQ7XP4ruZqgu83aT0wWC7JzidE
echo gY/G6/N5AciWjGCeWNo1GiRmO0QQMbuYjQ33S3XJubtUNZgKboV+BqZGTzo1Ehu/
echo QrmH5+0khFwpNt4PeHcfS0iKKWzOZ+k99utivEUZUnkNgIVXKhCt1BJhtAPoToQa
echo XVRIE2uJqxQW2i3o+90ze/2J9gHrp8rzKDOigFf9SfBD9wwDltbZuuBOiD9+FwpZ
echo 5OISfFsX4yZm3a9FdmCt7mGjeqFVcjHvuZOs0dqOezM7h3CfKtG7HZ1fPJu51YH/
echo 4BTZMtT/1V0qYzqwhnxi5AUQgdDxWzm3r87emNlZt02pB9FYcMU+UhHjLtrAlTee
echo LNsvB4n69Gja9s+SROhEV+mlc1mVFW4OTZGwELr/D9S3ldb7sjOd+GX2HDAdyeo1
echo MW1tni8M0T9byinlGVCHNkuZ4n3aK+bHCTyqPwTFgWov2+E/Rko9qmHu9WrKyUpl
echo 57+w/Ar/rFwq19nyHq/vHmcn61ZUT1/3xKXi0YL3UlZE60U2FW//X9+jOGdIQh+y
echo fvtI7X5DUuP8XHLB76GPHiV6UfpdJA2K4u9e6xqXcZZKTPL5cBtaN9cvkaWWdZvv
echo Cje61L0ZS3+f1FTapZLqidYZH+3ng0H1Zf6wCBOjP9HRFi+1Nesx+/bkONq3lXAP
echo +DP4s6Jwd9Ahnn1IbMpDPodR03ImHZkD4q7Xf0gUCVCBSCGrXmo+BPKaW6aFjX+7
echo RETADpMphqYr2bFe+l6J2M41Wnw/8xYDHXxvmx+ka7PltyyeX8xE4EH9RWkCv+sm
echo ZQjSeYfRINaregcwzFVBA+ihDJiDDesopOq4qYy/XAH/Pd9bz0uWYdMoeW3qAQqm
echo u/dLD34+yUVVUlq7/XuiCyL974WVSMO9IB5v+qUd4l8WV4EfRmKP8lsmM1IY5aFv
echo fXrHNWlWSlC8QWc1yAUCbFXudyGEKTsQwnZX6yUVUUJV21/9g1s1FPpw/R/n5fK4
echo pyPQ+YkZiIwQGLjYdEzS234ewYa7jy4O1oTkAQed236tVO1pAJTrDsbc9SeKD+mf
echo FH2rJGx/k9UikEFc6rqmrJhHut8yd7Yt58jHrPJ7oIkJ581aCxHjTD9Jk4dGlyab
echo Qt6oiN/OjaegfeyrlT+dEAoE1zJP4x7no8wZqVWS8PV6u5POL0E5IPuYJrKYTks2
echo 8doDdQzE5qRL7VMUusidHL1UzPiqqNp10awJYuFR6tl+jwDfE+285ua5i/XDYmbF
echo si+J7TIvOG5t6D4alXnSOC5LsgB4G3vk2YmbsIMDI42JTHH7I0301iiTetG/LTF2
echo t5cp8Cv+v2PNZdRSBodDlnKVsx/Ej+nGX3k8qUkjuNgL0l7M+LbiRENYyyodRfXX
echo z+BLlluufikM+tlVh4Mfb2JFI41HCTHFOflJAI6FEkNHVFREI3YFAERVEgEXUjAK
echo EYIRdQJFlF5GFkYTRbRYSMCovoEYERgVAIEYCapVjn+udtc6efeHgwwzuO+4iaqa
echo mIjcRs8Vmm1VTqWjU0zs0R26/R0w/hi0NM1irne51so3uFH4zvxzD4R2BxMW26PX
echo 8JHsjU6C7jFEe7VIkmYSv5QMS6+3VlVPkuhPRgFoRiWeDgOZykA5PrjN40gzYltU
echo F3qFLcRqjyeyrBUx1u6BSY19dwbFXkctL5IU2gFsD+/6xKn1Sg2nunFyTfXhmu2X
echo 8eiSkVYhe7bPPCQwHmbkeEl/9RQbaqup6tT+3xxQVx7edMCxGdN8C3f3+Bs3YHx8
echo oi1c/6za1FCvaUsqrwaQ9wvZmfULGRasEDf58H9SaL/lTQHGS2/KtMlsw07R62bx
echo 2vrNQs84q2cQ6ryHJfXgP106bOmJXPExbifHhpEgpOPBbwDGi/QiZsDt8Nt4K5gC
echo hkDi0x1iR9cfu/CiZSy1a36vfvsjw/zHZyrfd5RO2G8omjAczq+bDD8AEvjwnHfi
echo 1M4K2I3jf4X9PFPjfr/Hs+Xf40BjxrA9uVdeXGl3vX7QdkzT6qgEl0tybDBMRelt
echo 1MsRqS++yOnkY/4k54/MBrRyY+xrTD8UZw1NrRnxRDOurq23pOfpXvyWIwQFA0Hs
echo PfGnlzxD4LtttN62OBuPxJEh/HB9HAMLVc1JKra04h+idbYhwZYwUQPlKOvQlELs
echo uXcnzFsu8V3t3OBQN9Nt0uTaIyP4ME8iBx8d4ff0jkzMTzQXWFvT9MDkJ2G4FAy/
echo J37ccLfNHhx58czI95SDoUS1Y0wWn6hd8GDEii4BEA/n8EYsYhP7+KQgNr9S14fZ
echo K8nygWRwZ8SR+Fl9kF+RkCgcJWqhNXHvfhBufvJQ9dM971WtoUf13sC2k+xbKi8f
echo yI8a2V194y9O+cFrWaFxDrZobrb9BUtL6qSODzmgv6k8MS/Fhl2zvzEUbTJ32rM8
echo wNaaahdU+iNRPBYrIQ3gEeepTw71w3jG0wgw9H3M/vbDnml8VDNP4x3Hc0x89EQ9
echo 6jsjMKZRiiCMwweBQNmK3ekro6iu6Bik3HNfqsM0BMS9qXFoWBg5LyzOrJBaX/qK
echo DbHq+t/IO4JfcQDKq4E0/VWktnXUBo1Rx38wJaXnmsOrfrdce6G6Nm2Yd+J9y7cR
echo QjXNGacE/X/6FN3Dt3EVwtn4vtyQ6HlFHqrK/Da5Oc0f4Sa32j9uKTJ+crw4Y1aa
echo 829tXR4g7OklfWVwqdQ5AjpDA47SaA3yPsNXH8nh0YyD2F93qkDlwDDe5pxMgqb6
echo aWJuRQfhMgO080trdnDvqYsvRNlZPwXOJ/L7qnTflw5/327rUXFOP91/1vYzmufF
echo xEq8iyoTso6RZDnuy2WYB5/Ki6Vak70NwkWqRi0FDW6/Q54maYuq1+EoSHm/BUIF
echo A0NRxEabZpnOoEFmOjIiT+g5nw4SyHVAupFNk2SYLmOA4an1i90g/JrkNgUDE4SA
echo /SObbnDvurdkY999GjHcMBHQ/KI/rffoojMgcZ13fq3kv8/qHl8I8wuUT19OqOLd
echo F0P8IUdvcT5FIZsIHbPa8x8hBhDL1D9UBXhMp8J983T+lp8zYpn5P+sWAXGMeNhU
echo p91pjF/DJ7ss9qAFA2y19LKzdzEqoPoOmBLax2H54w1tQH70xeanTjwnLg4s/8TJ
echo I6ra3LXqRMLjddOpbQnMC8uwJ1pWiGSWNm0u6Md5giJDPkIpoK900ax6mWOau5c9
echo d4v23nX9vnSUF/RMUyWLEu8iCHCKH2jT7RXNFG3GK3VKJ6AKBwmPNL3TGYaI5yIr
echo DroZ/kxdZD7P+3qrHowWb5KWTl+fvUSDdC2HgdyCuTbrx5a3RMJfNfMI8BCpEw4V
echo 3M0YEgXvqip/oOwtmsm+1d2JoUKziMbj4cv5S+4JlL8cgE39YfYpoMfwY96wbi3J
echo lKVVX6p5xQHE+vF8SAeD5B8aZ7fDFous8JZqbmLV2bZMuqYrLN3k3jtEcTM67AaQ
echo phUjikjK8FMPkJcgUbc44TJBLdlvCLyGnx0fqFwS+IKknfT5Sob8ZBdgUtjlZByi
echo fqbw86BQNBPjNyqofLqqNSUK1DBp6lN1gowk+B7V+UoEkwvpjoCgGyEWKx7pRgvN
echo cFYdoo9TQTIxLqgUDFgU2f5eOnonDYuRDfy9toOxenbAH1687C92PzXIvH45o9Qb
echo mz8SMfguxiySzVEip6r7B8c4igK/kdcIS7Te4PQVIamp6eT821OmpFT1s6o3Zzsk
echo mlOcFm8gaF9KgZfygZWiGwmvweVctCyTCJb/GJSj22nBgWjjMVKV98gZyxC1/i9z
echo dKpphv8Q/fOXa35E0bNLe6enD/rlIwST1TzsSper/N9y6LZPJOD8wCnIuNzYGfXc
echo SDz3v7Lv02xVgZiUFQivvJZv2JtM+nJF0FjTdsJlVqIKjeipCMb/1n7mnoGg9NYX
echo Z6L1nAV/1idHp1oSb8VvDt6Jg0+qq805tcXyfeWVg8dMWbLShV4JdAqYpCM2TDN2
echo zJeKvX/Vu/PE7PJES/8/iQDgwufTKyOCPq4J1wBT8S9w15ndUZ8krbAismD8xK+c
echo yBMvqHJaX8LpPeTUtubezF1WtYOdbsiBk3iXf6OT4pwm8gUDbSp0TXW1OxExG67M
echo RnX5JWhF3Lz+OgXUktVFDaxWw0LRKBh+SwSBcgBV+Vr4vC+CPHA7Tm0GMLoqLMx2
echo gL9cXLL2NIdp3Ailycq/CCLBleCWQIqCuLMIA493iSf2dxyB74didrMPu9b+KnfC
echo uY6xY0Ewlicqg5bICgI4PhzUsp69k8PfNF1z2Y/ygaBJa7OBt5hPXPQddoBL2QU1
echo FyxHYLKa3ZZETiJH9/vSgNDovlXxSDc4IyYe1BK26quvRmiP7a8VofDZ0ME4bURn
echo 6iKRG4w6216Co7OKMtyKDLt40cY/Vb7DC0RaCNCQqpR4DZ3Fi9ZKS0qLwEq5POLC
echo JsoHkotVoDeLDgpOQmUAlVR2Ez411ZuwCKn0Splmg8fEeLxftw00bzKgI/KkWMtO
echo r1FEQpYrpoECgbNQ9LgcZDpLcH6FhrBXV4f75qgMtIg89NHEE9uqRJ94kB8kpvuT
echo bBkm2S9mKdcW+Hy3NQBLI7KylNfmsy0mdp07qKO/BfQ5DMEFSp17ybNQNFxknRpY
echo +AUDKq4G1iNzb9a5lj3R30mM3Qfd6aGC8toOxXlyXn6JNuEsG5WXx/R2rw4NpP9Z
echo mzcdNBB0koabQTFe8SnpfIRSWxsYNkKOQ+UYlOF8oLDiav4mzlG5v+9T0Niar56t
echo /cAl5LK/jGjXipEQ1U1BhK8HkT4jPnrw5PvsZG4lOB9d9SA8mQmUctxaOFtiTKLH
echo UVksYKZ3VVxHyTGNrZ9Q8JRrb8poEdEgrondnyB8zREo4S1jMoSpdBi5z+wJoMue
echo QM0WnQAeROd9s593YtD2gJ/355qKNUHh+pzlpM8CecXOEfyJaWgM3Fe/kEvujkMF
echo ooKA0OFGHylZbi/6wlFc+/AtqqajYTPlY84udxtp6+4JgUTJi+J74+6OPCvQkZHX
echo 1pQQyrvAoGLAQ4+ZEMurSPNapGJhf78I1rU079vLOdDPgSUjWLQmpngYcVi4mDIC
echo wb7oVZG0uB9oZb0boGR5eOpmLuNXkfqcw3r7NJxEh38hHlMlhbdUMmP3iGNVdDmv
echo ry0xWMFG51AJYYA8S/GKJ00dw2A5Xz4deTmWvwxHGGY5IrzuiFSCibATQZPyPUT0
echo koey+lXzOCTJ9vkdbzDBNPl1QvJLhzZ0cu13yxYtk/DU1JuN8OJZFcKhn71841/6
echo ig20Uifm/NbnikoglUCWYc4cUr5L4//8IGzSBb5IL8wbfqYKc29XxJvI4+Wf7TIc
echo /MYWnQbHcPVp/D+uSJs6WoNm9E0hGQfV4bdKaLV/p9pqZ0+hMRxTliLcEdsDLJI0
echo Kcs2q1fdGNb2+mOL6w4ualpiZLS8p1e2hZFZPw7/2zy84y5BGxmlE/FcPiH53KER
echo RHBsU5iUy7oOMdJyLxxA3oZBVaBcNLn00vCGW3oQzQs3IW+VKq0QoMKyrUt/UAjR
echo CqykDK9gPx990OPZI+WVSaipxBn/X8oGgq3UUjHP2TsGn+fom4mDUJSyUvVZDwVv
echo QDNocowFJF6A2m4jD8/nA1MwpUsW/yU8ymRjRaBQMUD/o/xO2aOeVkJB3GXDfWNH
echo ddFL+38Zy0gPiw62zOJrHnE485C9IFmIKoymRrRVxsOpbgk1hDZA2kM8+8BVy8ge
echo xsnMZt9PP8z/aVb4S7AptAr/rE2KhD3YLO76/Wx6PsfDlpS981Wqo9VUlzC5n8NY
echo +4hHZ5Fryla0+GU/H3I5Hn0Y8v2eqybvBLB/SnSPecBQneMnGAmUZYklLx63NFFE
echo ZpPXNokXqj2YtbBIQuIdPb5bGdnoNARPMP7GHOgx40RQv4kP/TDuuVP0zMKIa6v6
echo +IuFLxsbQNQyBxJDpDekz9exHGfCv0QbiYoPQqn/ugaFR3pI24pozWUZEUK6WfMD
echo cKBTghO9NLVdt+eX4zB1qfx/V0wUTYuEMXkjk80urmdVyw5gtc/y+/Yuq3P30r3C
echo qX73LZGMws38SHsRWhQcvXm46eL0BzHWmx69KZN9jIpfnJ64DUKOzDRhlNFwOiTT
echo iIBMgjEoiz2ohI/bG2pU0afsvAl5SLajPEy1dpGKPK8xprrfCYek7/oa/tAxM0xz
echo 8qrNkP3ucqYDz8vnYYo6XMCgbM3oo3v2e5p89huYbUNxfgGZGfOlRleWijmqeo4k
echo 4+cgUDK7x21N86nPiuU18c3Gdu1ZIIv5D2F89tmEt+mSJFqrgDwlpzdU5KJTPxsE
echo JL3VZFjhPvqDnfk9u0UfArLJx4glnXLgt8ft3V1d+bxSDRS6KTx84dSVlf6x6bhI
echo mmCvLK0aJ3FUgUarcdopWCPN+9lqcQTKeduVtohEDahmwKqAKJAOJPkNXvs3y1Wb
echo 1dUulTO5kyc5obhWvt4IKi2jcNxTX88Jyr14DmfF8mvqdiMPJm011wxpnGg/cif5
echo ad+z8rOlkBQNspkmgGTWr+rnPpA52VrFmxDLoL/42nTULjVgKh8+kzVG+kOS49+v
echo LYgm3Y/EiixAoxDkgxrUhCTcLG7KaCl3k4UPChiJjElZZ2xik/Lar2mQFA4m8YPf
echo 3ss6+YPXVqA2qVcKL3/n2aDMvVTmjd0roxJDDwHm2mr4S8bY6RqY0Re/0l5rOQwn
echo gUDQ3gxZJ1DuKxKbv8rtlk0U2+2R/Fphj3WX43OawvnPQjrAl1LaEXXmBFgXNCBP
echo n5d+uiFHtEEs5FdaN/gdEXCroDInk1C2IMYvLLZtqlHaVCtwaAa3Zg0rP44/Qsiz
echo TLMhiK2qJgvoK+UqxHkRBTMHC4y85r5k13hZQWs+nnhzgNFi6OUn58f1KfTyWeoC
echo +ZrsfQ6cB+l93pTsuzhuTI+4kUgUDF3FeY21R4GOjJH+bHRs5LWV4OSgMfgXyXrb
echo Gnjm9TPIT+yJEHztMeEaJlXgq4J284++ffFt+YtvQM7Lu6R/dDsnrkOs4VQwL3TH
echo KAoGUXJsn2QZaX4fyl+t0WyzrEoDd0Ce5SvDVNGONyYmRCMqSvFEKwZoVczsgH8K
echo Sn8816lz3bAd/Woru0zUmmntb6w1hFHcWM9/qpzAKBsyr4oI086+u3mk9/K2jkPM
echo RYOiIVma05iVR95Fy3lgbP61keEaSpsikokg5HbhWIXJX445X3fXzVT/hweO9LpC
echo NApvmM/lkuB2VKapmQh35stNYYyRZsQYx9qCieIfLW/ABfOH9bU/PsfqfasSy3pP
echo yWhwPc7xg61pjPffDDWz3vhgN9eT2fafzeCNP+eJfUx7xtrjvvkYcbswxZ0U1r16
echo wzNAav+uy1xvthKVVziBNjtOPz7ER5DzvCfSGlfNEbyfpQ086AqoqyHUcPnCFKHT
echo 63VUpjpHok4tGuAerWSfy0w6TUHlqRVeLNFd+pTjeAoGhwNpmYHiCh2EuaTD6h6g
echo Yi9QgIoj68E4xZcKX0KSyRAJfLZY3978GZPT+S3Mbaa9He57tgjNEr7q/EHVv4eV
echo Jcrje9qk80Ylo2R5YN52GyVolLLvA3kCBQMv4XdeYKNWbLuabJs7d0YjxSlCfJQ1
echo Hc2QM6cCMlw8EdC0wEYgP7dKXqSBsuSxfffPN2U+QtYUlWnJIYsOfm5Ty8/9ttvS
echo 8wtOr0h+DgQmZAMvBvFXNixczi2P6XoAvDk/nCWAeYJOjWmNKz4CgZLN6JeAOhfI
echo Jr7mBQMVF7rqsa+vtgijpylMtrQzYwK+LAeNR2t4vIZrzbuWYH1uxv/H947XBaAg
echo nzn37jXnMXrAq0mNes+BWwjsPTCOt3ctfByz3K2u4d3UWQwL2Fc8X7ZnMV9PBMXp
echo gvSOsoa4p5T9LRYCXkSwysyro7JORDyIG7qgm1aidXsI5w6b25ZgH5qfMGKu3MJl
echo y8bk+KjGRCmcWjRnemzim/KHftv7mc5kIppNt2JVxqBv6tphs2pJi1xlXmrKEdwe
echo utoMUOHK2YXLXUmPU4AgVAK/+WExEEifVB2V7AyT0qtxkSR78vlkQli5MXn6xN28
echo Hf2ucjo6JJMXW3zvqnrSozkdtw7cKaWki1g/ugaHpl3DE2ss369x+oKCbztLRiWp
echo cAoGJKUqJBL3Hs3vdYL3YPE8/VOD0vAUDZn3YjezwkfaPpMv+GauO0/Leq1q6W7g
echo hw1Pj1ZcDC4U/95YIcZ97cM/eWTeofwcVz8wVuXYWYpw9E87YpZFa1z46A6urVLp
echo TztZrWAtlJLiP+EuLTMUHjBAaQXV7EHq+Xm2AWSkiQ4iE5I/BlxZ4sNJFf0T+xI1
echo ioe8BKht1JwwblwAr/rQ32c/rpHtzUvmvawj4WTS8YWQhHiAWMU+oU9nzG70Lp6b
echo q++WodYCMgBLxzMY+Q5KJb5JuxclH7KJl5Q7DIYM3ZqVxoogr8sr83sOugKBoH8U
echo UWOsG+WgfudmLtZfFrG2sEwBpleGvUkzdHZrXJ9RkiGRzZwjKJr7zAfsxKVlLTyp
echo fCCTXpb5I9OdiiPX9rMNnEO2PagZ4FAxLGyTFnVh4dxhKUMQJBPfVPRLfcBspFGt
echo 3wFxurHpJDkpGPIpz5nVgCenyJY6G/6snKc4Sc5vz91ub0D0FBFxu2xhCvEfPGOq
echo sksHnKS5hPAUHOisJBzcRZ3y/rWmqO2LGaCw0CkBpwzu5vVsCbGLfrmaTCN3D3dw
echo FEgHfWpsFsVnh+uEm7fCf6s0v0weu+1ZiPhXtmCdGI7BY/b+FkL2Gblea3Hc38Rb
echo beD4X8UKlBTXUwy7HWXhBmvX1oD9rs4mfcGkLlipCydb7mgUdybsBQMs+n1w3DJc
echo 0ZLi1EjtrxrgzIamsImnpFRZv2PgINWsggUDbVEL6YoRqo05Tlp3gId/Wd/2hvOA
echo 7j6KcYPJ5bhaAytfPIR/nE6gfavAbHiOLvsxVcrq9/+ITFaNV/q6ZBT3WGTcSjU7
echo /IsPQcIckSc2+NQpRFuseEeZIZDuFjMkw8IDptTasgrZIMbHnG25+ErDQ4jvG6XC
echo Kuwl3iZGISvsLibmj7VrGjE11F3Zq9Xi/+6BigiShwZl77xyWu8L4zmiGyesafkC
echo gbNC3/pir3KxfP98h1mx7DomR0+FiHMFrZbSzNfLZfZtdAcdGrR8/ux3aBlKNyEI
echo FS1T+DkvAoGhM4XkxmdrWmF6kVq9z0cWKpSCiCGLJjfO/RAILWHMYADoNMWVl/Jv
echo j/2MFs6jq4TJxdEfgFVkJMaH9bHCu/6U5Ijna1fmk+UJYs8yT04q43cuBghGfCZQ
echo oTomPmwybzId5Zx+HNucTJnaao6iPRuPPUHX6KUi9AoGVdcFxtQSWDr7iMbJtNfZ
echo kh7LfYyDXrfRtwjiGkl55PAc9N7nLq2AX6orCJ12CVquMsNsaTKt8zfbpPe8tzza
echo EZ1ll3WjWOUeiZRRbI/c6e+M85sY5WR/aBi3yIlark0SlwxwZCXYy7zpacjk4FA2
echo bhsa7vpaMOar55q1acgx4+Tx6TQ+oxDq4MHOKPDBYI0DczBTZZY1SndkgGQTssYV
echo um6naQBL0UzF9HkiZHp4DVdhsbyeemM4CKVJhr5ce/D/NitAe09Nr/6ig2ylkiRG
echo ptKHPkn5WYo1zD7PebpsAoGJ8Fy3hTDBadmrRrs5zm2P6rupNgfxIB3NeV30BQak
echo xc0S+TWkw3bmb1hYY1YJRff3w+7R5yN/jlZgc1Sd7DXN6frantJLP1HbZ9Gsfna8
echo f+07uunESG7+OoTxHrKShw9v4zUVv6c7pT2VX+v8eXWBZkMqacwP0It2KwdthD6Y
echo AI6B1nFr64ril3x+whbsz87CzT+dMd3/9srYCzFnYP5j6qW1PejnB1Al+UEag/M6
echo O0bNflodGMyhBoY55ji5XUJndwYXiPapJiKc9tF+/AoGVMC3rcTX/IntxKOOKV1m
echo pD5Ebvvd/mKPcdr++T4dUEuhGdiLOypNr5RU47N9COvyA7rWZotgUDQZwvf1dJs9
echo sKaVXolFsO7iwk+S76cEsDtFuC4HBJIDFAfvS0RPbkO4Ilm/QeqRaDHL/HLfApHk
echo u8O7MJ5clnFjEn0laPWM747tryR4vUOHfwThHUGgXxag7N0ovb1T1j4OsOJi5T6N
echo YiBZC+lTegdb/5+ygb7Igb1NjmfYp9GgqaVGIBiX4jiDef49jIaeUtPcbR6tH4Oq
echo T6iHNkbNPlRfwtNpAYKg8JyerAoG23Ephc1yObvq5RJ07Y2o7sPRJNQFAxbp/Ns1
echo tYDPlmVX1t3cGxqNI8oRmCWhZr8CnmXf1MIqb8VbDe9WDvARKWOgv7LOinJx0Fwh
echo CO1+NEVcsvcFcz+XfhCnrkRrFF4jSqY/juNsWFaBMhKQrtadxuBY8tOqOEAMeRRm
echo LgGr3RjHS1icL7cdbIdxEQA82ew6tY04jlSPusS4yT6VwjlJ0BiaSCrnzG2rTiWm
echo SW/9mLN+D8rsvGAzc3k2qB+EL1pkb28ja5+1HDWhwBKPqvxlaj+wM6fqoSdQMZk+
echo 03oR3KZpkt1z0EbUvpZ0fUxTFRS8NF76sH2XJtYdnigPvM3ir8BQMtk3cAs6K8ah
echo TcR+dLJPDyyCwvcX7AmviMeRI5Nko5JATUm1cCaxHxHAoQMSHTcqFuJqFPJMrpoY
echo N77EtXgTQ6EgPGKVa9XkVDGIF6r6n+OoKFGWe/u1LSoPc0MJYcdC2IByFQv+XMkG
echo rN5d9/x9wM7Wv4h6BI4FJ8dowgIUhmPkQgqpLHErE8l8MQ6vHklMhr1+J8gacPPC
echo QNqlowDlFBKrOmq3R6f5CSwQCOZomhRSP+S2cDgI/3HvtgXrM8PRmhznQy18elE7
echo sqeCO/WNZjN4wfYcS4YBz1l3KlPipd5igJe0TWqqsZ9vTMNUTQLMO0OPmRT2iH7/
echo dw0KT1DaeaYV3ONkCgaDzDWz2+znrQSqoUKuRMe1Jl7ep/rjW3JEmXzWc91Gm3Mi
echo RT6KPxRmCBQNm+BBi1rwJ6otEWSvYh1EcLkKb/cVIeBTDRE7wyh0sSoB0GH+BQrd
echo fh8FLcvWnfnGvomnce/jyFw0E5KOESohVvjJ1b9nB0C1+ocly1DO+nO+KZwnW2BQ
echo MumPYKj+CRhw/LCqhugVacoq2IG2jN7vsnFvMxWjmOeMB6pPyD7ms59kVP5BFmsn
echo 0+z5cjlsB/ykfTH1W0uEg2sAUDhNbZYRjDF5mcNJhqsSuxTSrEcgjrozYeDpda/4
echo fdEa1aVQDCCHNWTyJ7KxyZKlUr8Pm3tggoI7M62eodjz/4cPDJ4JjQ/j3eKHkJNW
echo MAKBoM0NGk2C5oIsFrPN4nS2U4ysYUfxuLTEGXk5pftFJoI7Ag2bTeeHC1vJN59G
echo B2YEsg9dP80IXAoGLgM9IkDuvL3wqIYRZxcSLB19MUAfLjpd0OXx+QKQ8tvnSq2G
echo Xicdx/U2juUNfP7Pv4XZO/bsXiXTzFy4Xo35TPKu2kyY6h3F0qAoGU3TSeQy6/8p
echo SoN7kFmi/sePDdZlolgn3/L5hha83u4SzDG1jguOb4UY6m4Fq8VH5d5wFvtVlQTE
echo 9RHTS6tcaQmmkxGhM+9Ligo5DwKBsz4N9msXvp4UeX4dPVHVLpWOdoQWaPc8HtFz
echo LoSPLQsQDhPdnofjn46CMfMd5bhdVleMBp8CiqUX9HYOM9CrJsyIz/Q/tqbYL/7c
echo nOlw21dTk+iyeNZvqs88kxE0PA8VYUOUp2SVHejQxFMy9HSixySgUDiayyaS56jj
echo nsGaOzkJFOFytbL6Jx6hn3flQfJfOydvt/95eXZC8xHS+at6D+VckBVWOvPh4qxQ
echo 95HLmdjzxy9976Am7yHfcR17ESbjgdeql99ARiGGFx4qlnyNKRRov00j1BGipzcJ
echo WLwftNI7r9GG7VSSuOMpQsDtf2gaAxpao8UVaKPGTXs+wecc958+7W2ozJ/Oqkbd
echo mM+7HYf6yvGP/qUzG4at5/7Txp7npiUVRnmZJFRH/eh6254/XRAUDbGnRnEsIUqd
echo 3rGNubWUjrRzh+n4BnzsxGuBfKCk0nsAmZRZW1UDoFmqu+lwIfzZtjCaUzp/G0YZ
echo ftScIgWImGkeTB6TAGZh9kAm9DpWc87GwmZYy/nkTxT1rEiNQPcRXYl7jkIi55FU
echo M/bla0U6X/xrj62wjQrnXiuPnGzXGfOJGw0ntEz49Z9RzBTXseXNN9/tbfshGMI4
echo QWdJU+W0f3wxR4VYoqB3/itjWwL994m3FL7QKBs1bWxVEJxh273yk0YNBeKicGSm
echo ESQeE8vQ4o5SUHbZF/6i/3tl487OV/K6yeJVU26R9E7BuI/GgPEvVqVqrLdPkwzI
echo IDZjNXyOwX5LUM0oifchw3pfX9j0F2+4xYzV6zp8wb7pfgGj7idct7/XurKW6icq
echo TGeathLrRvCrheTDWKcBTtT8TAjVeuwjOANYfIdS10s90iDNUbCNQ+N/kSj3XpSb
echo 2rC2+EF0wqvJ6w5/cQKBiFH5ngCtMHdQKOCn44Us98X1oYYD+BviKpK6yrOBhn2c
echo gLicC4Mqboj8fApHa+XayUweUbNjgCgZXqH+bPF8TvoOkVSVjBXLhg3MnzXmmc41
echo b8GqoQ0nTTgUMgdzwq4WrvIuPWy/d8Ju7Kn0oS8n8cnlp42b79D5/wsriDRV8Doj
echo AeXApS7q2AVRFuBI/EtVp0OMvI4LdcClYJyY1lefk0l4ml3kUnYxklQ+oFA4mraW
echo Hiq0jMfWmKWzAfe1Z8edS9eUEOHwzPu2jflwrP/jsI1Gf5bEqF/HjBnfEO8koONe
echo cYdWKKjxN3CffRInrgFsb7K8d5w9oDKPuQVXeAVJjk5uqMKpxkSeqFhesVxCgUDh
echo P099kNJOfxlCR50SuzXmvxPrhWf19WhnNeFlxjOUHWntyM5rX/vdwjRNLgUrBRxe
echo vHUBJ9+cNim5dReBnthGkgnAuuoGpjb31tCHhDKFoEyb3ZW+QY0MawqaIIG/O6MX
echo ZhMrGhss+c4rdx3V45BYUYVEAayKCMugwOP6w2B4of03gBQNtAu2FmZl8TLiAO3Y
echo XOPTxCXfbUAUDFEcVPX7+mcUJSyXr4YJ5aJ05wfAUDZpfzd30ZDytr4sfg0unWJ3
echo r0a+NEWpME/rK2kPAnJsg/1/HB5NcvKfQh2m6Qj3NU8kjBwb/+lS8tcqDTNJXPO7
echo RBT+BDBVeKpJXKjLjGcXy4EcND/PCeH3xGnc7T2StwzJBcOenlZao1spQ6bXIamf
echo D4c6/KYw4mWtBJA1T7f5HQjNhnEpStbU4GRwEhY+bpX8nLGlosJ0t8Gokvz9RLhM
echo uou2X7Zt46dDJ8rl9kKWCfiOyELsCsXam9ob9tdMtlzFWqRCO6dOLCM0Hvk4v4nf
echo zUPOd+hkjT78PET/5BGY+9e1+fQ3Y4UqpXxBUWI/wLAHAd3voSyJsSekWYQwG89e
echo Rdk5FwKBxMEK+5gyJT0nGghbDvVo5ze1qBgeCjHezV312Kd1HJMP66tfQbOAG34t
echo +FJtTl5M7CyXMkhO7yZ5n27tXAexKw8BfUottHNOQo5mWR7WeBG7Ras8O2HMUJnU
echo EbNI1wqDNcCgcJgfUOpM3HnrNdljKIlRCwEBfGEwHqLLG48r5C3g5ltT8aYKg3X3
echo sM9wSukXD+On+fY4jLmC1g7mO/r+LxH+Sc9VKrTbvP+PURp75FP+2ciGJ8X4W0QK
echo BttzY0OBxJO5rguGEHkTsSXESftsB9UmqHOiHRDkGQ9QNJG2yRVcQ+Ra86cWJL5f
echo 7zFgZYSxUHIQyBIqmTOFP6+BHywX+XhVTP23DslD4zMatzX+Tujt4Cch3nERI28R
echo EPQZ2H+6UXupnlk23CaBXDCfE+M7L985vGjra9R1me6y20lQ5a5B/KckU0FDW4L2
echo z+Nx1YqSE3IKfBtmZ1m1YHr9IJKoXaRRU0fG4O9PNffvGQSfPkGhfked7nGE50vY
echo Kz5QTmU4i17E1X9vRM6R1u8LF1l/w8YKl4osd2Cdvh4M1ybQjba9ao3nX2nkXeaV
echo Fj0ZxnYtB/j2rnRfe8pYdNFaZcxqOomqLzNjvBiPWQ5j6CS+8EIKgLhbBL3iEXUu
echo bVgwKAFexzCzeUxAKBi6Xtwf2fE3sTMZRbjv3mdU6FvCWGc5kM7TaihkzqanCn5V
echo IrmV0xHICJdkt44cOTpK9/vTQl3HOZ4xEo5N64sYFcO9+zUf0WQlfHhfzGpGpC5T
echo NKRVGLjHMTIKnQFM+vFgUDfPmbWc7Zsd8x7UTj3s9BHNvI1k+ZEl7LjXMfJSXE9i
echo SBQMsZwlZ1aThq3DZOfDkcIeIoq2dV9SKmeIRwsYL6PT8A4B/abL9Iy0Hz504iq7
echo bNF3HNvwaLw1i92Bw0sNrEj/77/t37QdskkcDcCPRK9C7jFT5nZMtKzw0P4ElwRm
echo vPfRKoBvxYiyceyd/Qig+Joo+vz+60quD57+0tofyOegq7fxzPQD/HjodT1M5zBa
echo 8tcDg1P+NnqP1EkMcNFT4GCshqfrvywK/67OZesPUncRSd1Q3OPJKRYbGMK4RpUh
echo 0P74oaUylm375VnmdfkSuIlQyHDyC0FBIVnGqiMG/TX/jiC4LPeep1bnAl2WMMSl
echo fskN31D1eJEewhddoxpyOCM2q6ZidsMX0+JJNlDp58/EY0gjfCHiCaHA2Li6mPpH
echo 83VSeA3Tlt+QIfH44EsjBkhG0mA2jYshwXYdeuHmUE+2W8jvrejn3LZlZEJZc3vF
echo /Kf4Qn17BuFH45U1apLaCU2JYFf8ze8mfzwl1RhEvJgTkoOrr1sK9aQY5qk1MAVO
echo 85mOHSIdfxnXYp91G+tFxGCKMSfmc7ZRv4Xb9tB7HTzh9nzLJjPONaiitct0PsSg
echo T/o72wMa+NFR/e4X5YbEpMrtfPTc1K2mdf657f4H+dBQSgceoQxs7MU13m7XrKf7
echo 34UcV+3Etv66oj6BiIehpMwXTBII2GRaTuln1PjZj6J4itPfEFLwI/xmqc2L9r5Y
echo OU8igPIfvXrkFP82NBQ3oatpEFx24+2X04LRBifzf+mVeQ/KGxqgSk0F9ERN9+sN
echo 1xZsHqZ6nNccLbUy7z9u6vKbmLWdRjrtcI76G/T4o1YeEZ586q1GXG/y5YylUveY
echo DCx+vcrGH6CXY86tG+VmnuM5ow4ql0l6P7Qx76F7ww83m9GeTDSdoVbnN/1xHFkE
echo bzuqHpyCgpzYcgmjuK5U/+uqIaSMmXCj4Y6GkYNtPpznTiAI8vw7BmesoEFGyCBd
echo M/2wNi78CHa9496cWA9J5dYH1ZCrGGv3QMo174aUQ2KZ8hGIp/T5Nlhqp6Vz3fAi
echo 2c4R+DJUIAp+IDMOjKZhfATK2rag4ZkuC+c14PaBVKl7vNvBx1+U/nBLCtdvXavw
echo 6a7tt7qmvfaZFfXXF2OZrAoGJS0b4pU1L34Yz9xjDz7K/0Kxmu/63r8t4ncvBnU/
echo IwkFboUzi8idhsVTxXbnUyh2vU3NeZBTn1ux/tIX61pvdRy8/YiVbCVtuBQNCnLZ
echo uQsPTsQ98LeL8wKMy3p0fCWyJ9iFVorGz74n0qID3d6LvLAlUEoRVB+iCmQ0rcJN
echo Ev2+A6tfBLVsp39c6VHU3OiL0K2IR5wV3G+V5pBoii+ZJJ5qPETmvL8wQSv6z+vx
echo hlTJJUpbA57ijAujNjq8wRoMh3Sjsr9zN+vbQusea3aH8XVkHLvhmGBoxiArQkQS
echo vDuY/tAy/53oyo7ZsGiSqztlJGwh/ZQNMHOV6lJW9JPHbLJnd5f237RljjKWkYd1
echo LPzk787fheX89ZILRmIUQojyLN34xsBQRrFn4pRfrWUsr3cjLhyNdB8gpr5sfr5S
echo FSkn4FNYVBUlWo+k+uZp7OhqhxSOBwoIkMI45iR+pqSL9UZkh8oiBX/WhiEJXpcE
echo zf5Wna3U35ixzcLo8nwKBiyjKlXaCTqmgU9j27QGzih4fV1YD4DKXEdMak/tvV8a
echo wWk4RRLyV34FA33L7DbI+fk8qN7+dJ81gXqHbKfWxVBNOrww6KloSVXcJe+Z4F80
echo aIVTv6XlrIYXph8ZdLudL9HuNqU+yyrR4bQlCgjyVZ4IFwosqE6dOs/Uynk8A/tg
echo ly3X/74n4y/LfigmaEf+PkoBftvx+qmgKBsy/81ae6e7f7ldh5eU7HVCUaq1hxib
echo tWiTX5NOpI8svAbJjrjLUJX6E+cQgYoUKEZQtJKuAoGhEu9XON9Pt9jg74zF3y33
echo 6R17HTgrma5qRiH/eOG6nft2H2Im54RWeVy01ep6OnM7bbOTAFgmuqMN8K025E6P
echo mqONeX36I50ooUQXVt72aZ9iP5VwCv/pfvjoOdbNjPeN/u9HDKV2BGWKcidowpCt
echo 5YWTN0D4Rl3XkdIK+e+Lkuc8Hg66QkdrRl9l06bWTCen4blYtYNrN+oBPLvaxbw4
echo olhD+PFpEubEK4qUTS2/jhTm4iWvzfGRMVGTERA3xBViT1M5pCfLv1DB5bA/OlwF
echo EUcTJMEc1lmA+iSHdjRjDEcg9AUDFNeFA1aGOVTtZBH8opKZnD/7+4L/bq6VR+Cy
echo iK0Zo/BG0hq0qm7UvcYFZIX0e6KEedhTvdqfMRDHf5qb2wV2j+SFViPc73SCQnx4
echo r61DYNRNBYflRHPPl61i0JbFlPdpwvvMHv2AV/1ntw1mqjuGCw2iDUS475cFRbA1
echo BVq6UqKofvhcxc0HQSyNHrybyqm/R99yj8fmayI8f4MUqYaN/H6KHFPcBqzFZ2zB
echo JWwMbmjxbsCM9q9FuRl5jYm4SI//Ri8Lgw2vqm3DTZ2T7kvmB5HstggwlAoGVslX
echo CBJOiJI5gUD3/sDtGNhPVEWrwWHNpqqwtGXg4ogagcI4FuA8debYhh5Hp2Fw8a04
echo l2/9P66D5RiqZh/sYn/ipnljUXulYF6YAoGzUNUhhj+On3RVLTE6QEWYd5bqMPzI
echo o8iaIdiqx8gKYH+uwN2U+0V4eFzo4xaFfxUyvQLdTRd4ymkZepPZ0+EPbgUDbYGo
echo /edkEic6OeihiA/XJZozGDv+vfPCPTPfGOv89W5yIKVyC8CPeEZWV7ESvB4qNzkk
echo v1ajB1ZP0fY+vekml52uIi4O+biqEVoP+scb7To0X3ACsjxK2NMJlgNiSlmLst6e
echo h9xYidp7QsnwRF0K1unanCmzUl4euMSUKIZEtHM+9efYddwWVfmlexBEYXuqd+dY
echo ImkENgq5e0PqCQLs2FVsFmjw6guPl2wk4GoZA4yFFjEYRhTcOLfKwitdWbBIeD+P
echo 63LNHfZUXC/+apLGbPnPXsmFfMRUTuIlP4noX/fqMIxU/dA0HphZY7t3olnHmF7C
echo rgaMxmRWUQB1HP2rGiS5SDAmuAPZzGzunzbOwh5I2VMSWuaRisGq8FUxmn88FAN4
echo 91jb07ODY0lIdRMgVlok8MbLfVAYToe6jt94SQveuaqlA5iqAzgj37kx5WgrbYzx
echo HWUt92XaZeV2eXHK4YjdgCgYsBDTGTRpEhCPUTM0Mv00rbrHqEBjw37PsxbYV+zX
echo jng1Nki6MFdFPAKBxOZCHEDA6n0YDWAcoWHrPUK/fJ96K1ED2s25QUtyI0hHY5Hw
echo 8xFnA1jFxf6IRrmjSqY3NSuAIzAz4rSYfhr2+tNWJdybeHznxtSVQfhGEzbEpFIj
echo TWvt2bATK13r2R9aHBFXwjx29fsJmXPdziJHBLK+QzRcM7Gr2mIFA20OKbXP7MmI
echo TMW+rg6bcF/fP+J/AcayJvJJwuXRNyAHCpU7ex+up6xYLEr/TPnaAUGqqNIgUDQn
echo 5NbhfBD81UxePMdlBRljGYJZIB22L+Mb8KXomGcfRENDv/ncnb3Q+39VmqKFMsyC
echo PdQfAFfy8vhpK2z9kd8mhY7pFMvxbnjAKBixwuyQ/llRMHek76TQ/gP+LfpGoB9c
echo kXade1dths4yB2nVkfnZkYugFf8+ffMHpxLaUD0uM89cSO368Fqy5355I/ooy0Uv
echo N5UhvzCM24+jmvhkhWGoQusWiEwe7vY5fhwLP+slaVag74nreTzlLtdZ5GDNRfG+
echo SDwfDBK9/lbu1fxIIFAyov1fhoeM0ItPGGI4dzyevs8o36EIctuNTGkBQxSNMxwG
echo pfh1QbvON6KfqUsn5V/G2n+Gn9L2YiAuGxbEMY8RcYJl/yTNOIh8JoAiVrJaHZFX
echo 9Dc21DcyaDb1CZyP9K/6P239ZX5CwX36ezMwLf7Lok7nY28PqkkfpWs5O6OUg8fO
echo ClBcoRSTdTG5ZEbDrpZKCmG+65OM+c1ZgmNLlyB/AcQVe37Y7sCsSRPqzV1LHGXG
echo 9k6ln7lY2zzNdOcE2QlF7Ar/rs0o6q9y1Kll3sRFZCnmn4jT8Y4RoP8/H9BIVX2Q
echo e3ImXT0tDYP2wjurqXLEgyIqW1lJyjRaQR0wj8hX3ycldxD/Ne7mO4SxsMs+EgNQ
echo FA0EehIyfY0kOoZvGy/Z9j3yRxvr0yad82qKDc/Z0W34MIFAyuiWoGd3Xf5vTYyT
echo pW/9BJWMyjB8nI/0Vm3INzGJvKtfugbaDlTRqV/QXyO5z6BUb22cf/dL2AK/+irf
echo TubSD40vVJ4kW19qfVt2k/IFA2aLDbbpLPFM2/IHkxN30Ctb5hDhjNbXrIdt5I7w
echo nCGzf10fqbMyJxFXnWrj/Qc0cwr9XiXEHZrVJDhWa1vwsowpf90DbdOTYjD3PVGc
echo SbmEPMs/Rfh8P7MCgYu+WZuRV4VVP/NEU0PxQTEgJhgI/43D+KlNHDaKyqypJfX9
echo LdDUptw0S8ftkvcOjB0rXHnaPCMY/fY93Rol5qCKzXxxPqncTFifSiKXbqVnI4Dn
echo gCYxQnXNod36fYjBG41qXxx1znFoJzdX6r+XR5BqdguXLYIskTpo4COvxf3mai2y
echo xxrf1MmYVjDTsxjf+DHqPDn6RzBy5/kWoV83AKBlnIOT0z7zG/cX8lkgDzJe2pf1
echo Y1iMaWeMMmHMkcXue0B+GJTocu/so8lu7h0N8xJ5c79BaqC8pt93Jsfm9JYUI77e
echo gAubdtTxd/IjxBiwkZdsqOEsI0T/WNGU4hXT5FxDooSSJC3ypser1BL3SgCGIaFq
echo TdbCLq88ujGZSZu/JK4Hc5qAef+RZaEYTwYv+vzySs6ch+vkQuwi4WXo2ivDpQNk
echo 3+U2VQyclGuJKjV/bOjMdkXnfDDyx9mVOk5mdb5TBWQbY3e8d9cClT1GXwwJPYGJ
echo 0GTNSWUt5kRIW8kpvjThyDfD73V/D/P43qG892CU4Gw1aKdtepPLr3VOkPF4lo7V
echo axA+yVAaSEZXGAzvgJj9fqnBfIkHJsw8zFrLD7levWYeVgstLvksUqtxfmuwJp+1
echo 9bGNGbhW0wvqnDeIWqNOxtxkboY5VnrGj/WqKHAJ/u9AmJjNqTNdlWHqMnrgj81Q
echo RBmAuvQld0WQy9x81gV/19fApWkqgIH/fGVLN3/Efu0uJwdsBQMVgQD/BFv+kMmp
echo nCjMPrKj3oPzSBQNmsg/zIWcnVb/L47l4G8CmqNNgSV/K70PhE5wsm1xtoH9emSV
echo Ob93ozWY7Z8Kb0VIkaqYhlTD+ryKXaQadwrVGEeICgQ5Ws9iuZpPEgNxFf5y4+Ao
echo kpEJ6KCjlzhl3iyHfvaEdBpAktoZ1njiPXXo18xsXOI2BJyIX4AoGIzh0LYIJdU4
echo 9At6B3QpSOidJuxAoGzHcxALouHUcde36W8targEAkJKnBIdb0r+aN6x3y6xMA0V
echo VbPeUfX4OfHqXZd8lxSWEwLtASMHzetBZDperLttHTEIc9K1lAoChntFZrsxT3rl
echo 2C024I8NgPAcgPuXmQ1Ad6jLQhGgUwKnGkRSO3LYRhERG7t+WoJBdV2+BWVvhXST
echo lfJeGKjQrnVYw7HSYOsFd7TYdDRgOZVa+C7QbI6pHMFle9xLsoTwFRnc5TpnSAuK
echo kf4SY58jvrDvvJCnDPHVl1mACv+Qgi0pMXbqKJTaqQo4+k7fQgdDx1i6j6+Z0C5l
echo 42/vwn2AoGVH5OBQj3dQGunFshAUCxTYgtHbNPgxW7p710Kou9kCWKzBKrShFg3b
echo cH1aOlA2YzfFZ4M0M0CgYnR25LfbQjrhbbrQ8ebFHZ1x+yxAedpKc3n0bVoFTM/z
echo UKTosfkDwSy1YNPLEfcqOTjmhfdgB9H1cUiZCWG/bVfO9VD4mzfmSYiciuDhwEw9
echo 4bkE8NPpm/d5fhCd/nk5OwPqsSSFThAokA5xEUP0oaW+ESSjFR2O9j68zmzNJ7vN
echo 9pCFxdX9d0fCPIgQg7FWRhljEn9xsqRUTB2gz2QrIrqH3OOvmHarGOdRdCWShCGj
echo rnU9vqQsYVrU4k7m0eeHwM43+UDQ9Pjubwl1m3qI2CN71tJGmmuisusHzJTkOGwO
echo XFUmvACgZTrvP4ooDeTI+9hEMLhGjT/DCXsPbK2rIM3MiPbfBhdAoG2WhDyoyldp
echo MJFeqxQb15bDTEsUoBsfPtr+i8/hVvt1HavkftzYebXlR6CbFnw2rhat8cKM/vV+
echo +sjrWdGorewcIi5QKfsvLq1Kj3cA71BXoiL9TNpfd49UrAIt3OipLOhe17af9Xdq
echo weOl4AjqfoURf4xmoCJz3outPpgd6bUQuPFx/2gYiUKt7HXdq4U3+OI3dw/l61nv
echo wlhSQrd96sO9HB11KR1n5eSEIlUm/IgheOW/O+8TDPUXOZ4X8b68dZSF1r9cbvRz
echo tVbAPV4xkHp/jio3H01qPwvXNv8pVLOCviKGi7IFEgHeclqoL8tZ4ZsKUHH62Ia6
echo COL99X0iJElqus/bE3tX9vDo2Idzkx7cqv7LFv7fMYek5rzn9/wNmzV/y23poIbA
echo GQ9pkt0br4zHIHbTfcWMeH4+nKe1E9cB7/5fUTj9qmeyr/M8JuH40MPwgR39tDDT
echo W98BcyvxwcvS5vdKDs/jxwX8/yQDhLEORENsNWv/oU+wefEp3I2DnVMOdDuD5d+Z
echo Utctstf4z0z5ET6mqLVpwd6MT80tjeWGbef1pjUPrYWIfjJIPNh1jreUDjiNapx1
echo g3cEhRq1kCFTQSuCGTtwia2lEQhL9IMjU/N4paC9JfR/HoaI7vDkOz+vEW/NvuHo
echo L4ywHoT+vmddIielYRGLQipljuq5Bz8kMEZwCHJLj8tqd7oTC43tYIeW2IdbhPwj
echo x6EOlWhdcLrdNwUDJ7/++nmx83q6n3X3fXUQLghZ3+HxMZgmgqI1yjUvye/dNqhA
echo XnlVfrHPp7YFAxMA14QF83pmp3i4pbpIa/OBoJjQDcZwq8vyNZ8aNdjiqbwRo9Ci
echo LKMFBakSvCWDK19e5CwW1WSnFuB7qAol/MZo7Kx9EStrLoHM2h4U0DlwFX9UX/md
echo 4w1E+1dvx9Z5XIshPD0ft2T4gTTqPMUZ2m2x2ehq9zWaRcEC+y2OyJ67k0oQGVm6
echo tyARji45bAFf9cuGW9wZvhxp65yesU9kHo5EIYpxdoCBJ1U185gVLCkbAUDLsPw0
echo 756clXS55inX85OKi1OyxjqJsV3FXRrFqv2fPuA+pVp59PzKNj3qnr1lN12uLu2y
echo T303aIfp+TOH5FIUEeP/RAhKBhEai9qNeWfY9C9r+Wq9XnCOvjRBoSwmduDMRmnl
echo 828SJqbfwIErN0PRpMO7JG1F+LWTUv4zpYLxsYaRB4km0i9Hq1Bm2RErrb5O1Eyv
echo 1kXANG0uLApdVpRfvXsDi9DAmXk9ViCMndoUYThOhoAlh1BHiFhaCnD8v8ExZ8ES
echo aC3plFYr5Ex7F6N8f1zjgwqoQOPKWzIKkm36KdG3O0/RlKsm1ISv9rSbalWOYA/u
echo W5hOg+Wo2gVkUXBx2Vh8ydArHnyOWxbVQ8j3yufn+K9ZZpAZ4feOArit65WSEKR9
echo 87EG9csy7ivB2OrwsjX4atr64qktOQJdlIi9k/aG7g379fHhsTYN9t89tp4pcCga
echo GDzG61tG93i8EbKOa8/ly1c5jXGQ+/YWguUY2FvdWl/HtSY98yq/x6T7d2Jo2Xot
echo UVOUdh2u9zkFf0t37PRpHOC4BzG/MdTN7jK93f6ubxxxNmvYtJvTdD5VGLoeN4PF
echo aC4Y2CctOmrROkyGiX8kH58Vbmu+fpdP4Tsl16ppR64R0Q0T7pSrSeD2sYpSW8cZ
echo NJl5jIpRgjTw6Ja3p3s1M4p/a8aGjgfbOSEMV+EHWclDY0KwkN4uU0Hb/HDKclaf
echo oiJyrxNkb1N7P4Jom+defdbQX6V/r817VP1oBQNtHZF0OtaguMvl+gd1nnE+OjRW
echo 3wFAxUZE43/BY0GN7w3ECsv2+zmfyEXAx5DBT9OJxUo39EUYgx2RtsOFPDUB9ndC
echo REqhiP25DkjUvXcs5WobIRqKKK9NoHh6U4U7ImmFKpxWvYl8C5zU/V+oTrjJ2d8U
echo rtZX+70fc9cvKdnHfB7NTGvUtptQYPO/DayW51XZ4X47q6YR4ztFLA4fjV3u+r74
echo +N8FXy5W96B2npf619HGFfKkoIii2pDbT/edToyK1cE548b6ICKHS1TKq+69Dmd2
echo VbgU4KP13Zvmz+kIUoSuM5o0/pYxMvVgf3/WJIuS3wfMefA726gvA0ApSmvFTGXj
echo nmXy7enK7xAj+mQAf1PyLhh6oLUqaxSKEPSaTHtyscAoGhhDSgQF5zj+HjmzptCg
echo 7jp+OGEcHrbKtHEfZ6B5M6AjVsUWJSlagWHoUnbvxPOL1ZZ8B367ON/Wjhw4z0qW
echo kG5+rZklpuarALMUIgk+HOPF180ShwawrhW8Pr/W0fEI0LDFs3WvFdJY0HocVLwJ
echo d57sLUjgCPJbhvbXmRIXRJJ7Uv+0DLOiSsaPjExXIbFKaz5KVcIVdHwrVdlHLeNC
echo R4KPR6mACgbapSO1Gaea2HdBUUTfgpXin9AhJAUDFXBmE3tpA/2ZStQfMXem8/SY
echo tWoDsBxlavkLeu2YY3zT2Bf3plt95CC7slUbC5qSJQ1aevndCq2rG7rCWU+jCXCy
echo i2dQw5Uyrhs2h9Nyco673H4EWmglmkFbzse7iR/WlxIpX1fA4vWJZBh01dmset3h
echo iqXIW1L2xWY5lBXQZgo3U9hUg85OqqBxSQi3VVC12C/J4zDEUVgci/1VaguEuh0Z
echo TfAzVvpJTH49gz7/JYOdCfMSkR/14hzj+YWtpLsy/HjRUjD6aczM31Bb26jdWdwj
echo 9rqWdyT+Vm1F6mJwjth0b461dH2LnEA5tQNyHtb6dQHiwCNHDRrqe0TrXGfKoFLx
echo 6oj7J00UUTtb68zCKjWf02RoZX32QmV3xhV+vN016rw9ltDBIpbiRPLhQEbUBuJ3
echo FR6j1uERgoFUaFZLNizxnO2VoXM1eme4stjir4QTaxZ852qabOJgUDhIR6Pe2N0k
echo QvOxm4Wbk3lWnY5vABxJiyz5PWxJz7Dz8DUy220OQLdkHy52s0pEvuK3hUQ8ClJO
echo WmkCc8r9KYpWcnjX4YKFej6L+cD1id4xGvmx40/BUrxUo+Z+l5k1LNAv/fnT4yxp
echo jvcPyu8VxUvmboIYNMCt+hk+FCyf6Hn2zUHSseiTtLVCqv3QMVxnYGW6Hva9x4ah
echo QzG//Q0HkjEAoGzfmFUPEG4Nnv/P8ipuHCxXe6CufuG+xckBnLU9xzrUEdJJHDs4
echo Xj3inoQ2O852F1tZcaHy0G5/H7Q99SMv/J57iMayVt3vUawU/MEdAdHJfGFlx624
echo UxK4J5cxIgT7mb+JxKyfIyxRhb69tddAj/aBoNV/gsz/0q8NZYC3qoJ85MgbN5QD
echo ieYgTp98ZXjoQuJhLPK7SJKdahJ3lOB82yL25/vzLIFJpDGzqNWs/ZX9FTLsWyit
echo 2C5EYFAxfFxw0xaL4XoEOc6hbLXa+ox+VKBQNmnP8znkrCHAe1qQzjCbENi+eLE2
echo TTqjQ/OhYSHbGcW9fugZaYL4hATEVrkLKyr8OCxXy4N9FizTU6F3KESTork320Bv
echo 4MmJ67coyfJM1yQQSZnm4xpXvGHRI4j1Vd0XXt3r0ID6sw+31erOC9JPrZEccY9M
echo U5psSfBcVUVHt1C8iBThGRPR/ihj1+94866KMrZ2mrpl8RUDIEsF6PC4VM2RSRjS
echo HCRH+qolKAz2DSFIt1lhmBRHTVVhnTMP427WNjvyewcGtIa79yhogv64rnfnwZmz
echo 9GJ3Xohc5j4AXv6NPqS5AQyIubmyi7KjfLsfxGRqDdYesxTWQz1GcWAav+sJ93Jd
echo 37ab2XDWXoWMi8Q9FhlDPgOB2MKjxabWZBavU1aKoXQb86JXjcHv2GwcGweNlnOv
echo ApcsIvaURxJM/ZjTL01/x//Gk8oh1OPK4wv3Y3LzpMEZft1RcKKLMat6NppA/R5G
echo H70MiFGXvhjs01MLTXIGJPP/w5t/Ev1niueNwNMLC5/thoo12onZusY2nVFzRBwy
echo 5FRSA8A7DsahRkCGjFY1TvrQrdMeNrHu/f5ORxgab9Re3Juf7vwrzcgUSYkcrdy6
echo r8ycys0vsp/OqWc7IPKsjo2JaKoTuzWMi753tTbzXlFpcVPfJ18eNo1wD6IPXPGM
echo 283z+SjnkLy9LCClY4kJOhRVrVoKZbgH4YSzD0gG4G6QOQ8WC0YqPODzOrSnoyLp
echo MEYal42T2JRElaZu/x+Yi1vKifJiQ1dVVEQjBXYANFUfQyiwiEWLQCGEMIsGizKG
echo UCLFoaQCLOocQwh1DSEhDOCUx/5X3bXOn7niga1WtbgoCZqIje9xPilTjNTWZmcz
echo itYxuu39memNdFeEdVZWxOkOViIZi0b7dryYiuyV8HEeojI/ePsANtlWQIxbNd4Q
echo L9gZsP3+Tpr9IZn90K4ftAkDIU8lBxXDHPVeTwEghgR7gXJnvtSG8r7wuQ5bai/l
echo df22ISr+oScI+h2X01LuuwI51kzS7NkGTp+3wJLgZS6D1gIE2hSGLiPJmcUunxCN
echo npme50nI7YYCBCsrIgLsV3alTe07ohdJcNtRvtQgLtzXQnGWzZA0nY4Br9VCR2rY
echo H8ACBPsS1PW/lGPboxEiQ5N6NxKWIztuT2M67RmjzFdhEN3/RD8K/saqx3yciDrN
echo RkkCKRQ1159oF91K/98A6kazfl7Du8ejZEjCMyvTlqktimZoJnPwZgd2eSKDvbGY
echo He/8ES1BTeXdhI2n0J36454dtwI5vK09cFoPwCBFTMbgq2vcVV7GdxL5o7CKbBKb
echo c+8cPoxf4S31XSb1A2fMyLWEJtvlTJVAcyzroCfSIJlF3zX/bb3pACJjPSp85Mln
echo 681VP1cbOEzLbeq8vDz9Oka5yo14/Zf+3Tk+XjinOHtfIpkJPjyN/4yQuMZLbwUu
echo jyddYwOW2y3A1DLcW5oRuW4Ap7x7hnV8G0UtJG6lMfLZ9mLVzVqsoesPOcZ6AqT/
echo aBCUWYKeJBREUCxWApKI2/nC4D6awCBMzf5xoOtFQZRYT7XWo3HzIkIqzmo1n8Eg
echo 3F1IblMVPcAECLA2CphYQqqZLLoWXdIw84jSkDuvN/qr7vzL77knbk7gXEkip6bN
echo eRNvbEzfi79lT7WEd+8WGOnFCkfXQrxT6oIBAoSWkFuP+6ficzokxhqa5tivon0e
echo v7cv5zLN6wxfmuHnXCrUa7UtXmVI/t0FZjPZA2aS03ekyazmzU1JvR35WptRzSdP
echo 60juiQXl8fj2+m5vce/kPnwYQoEUv6375z6fGky/x8dTUq1H/Jyej/NnGFeXG/V+
echo 7xIJ+pfJyUrpQ9EZ7dVGTQoxS+JyCXuZcITvYYCc/XwAQIuso1zp1+xBGb9KUClG
echo vhQZEcRDuWyxYZkqK4yPNeD7AX9nQlezxyJJN2QQ/X5kJNzGColqQjNK0cUrvc5L
echo zsQQNX/2BSYXGGw/gZ/5hEnuZ+d2Y5eA5/pAgIEIUhv99zR1MzTi2i7rPs7VJKki
echo wO7d0m1hK0WD73jDf5D7B1/AbbdQx2sJnUz9lGEMZze24M4YBAkHDpdfmmEhVM3P
echo bsNF7Cv+ZbKtd/bjC2yNXYWku0Ib/dDDIXgZnB8qABAmay/zOd3b+jzyu5DaVnor
echo uj8UE13ZLxIlJ+a6z+UHJcDbMJlBDW9zezOnm3n7v5llA8wqdD+BZAIm/vD8M+tr
echo KM3uZMHhMoFv1O0eWb8dAL/I5EBczjAUkPy4D0EXU9xfgJRAVywjyaHgMGVX6FfD
echo /dpPkHV19965C/HQE6rFk9Ujlld78ZfVv7APaEgrea/hfggur/8zqnp/2gT6aNji
echo 6rySd01n/ev5v/E0U7+FQlRe9SzoSZF/cIzPY3v7u+zvOPcgoje/gzzgjTPabvqo
echo edICBIZjufLDAS/qVU8a9NYs+9cjfxDaa7R3MXzAvYCLk7EcBe8no9Zwn2eiCcmN
echo uJP6qipuWSi/t90h8ZnIjqK301HAL6YgZmQU+YNml0qFzfDv8Ahe+0Jexh3+LGhn
echo CVOA7tjSo7PBq4Pp6RSlq9PdY79bYzENXpWwy/W1kgChUbD6By/tj6nTyLm7HPyv
echo Y69C3KQS7FF0Kj+2cFJXMkyaRjV5wykzwpIbTXyxkAYzwy0P0cu300Qu5GneimWy
echo MZxoOAQKJl3o11kstxZL1CBskcfMoatBM5Ve+QxpMr/u0ttrWwbIRZY2j2Ha9PbA
echo sW4/V3OfQMbiQIO5xOlke6a1FR0XkV/SDQBfnmjWhztDLXU8Pxk5dD3lXSBnsAQI
echo rbD5ovZqKulux/KX6TF3ht0+rSFZDdi2g/lnXebOzFAuEQZll7VCbUTV5bHKiXJO
echo cWlbSPOXToxZz+XdssNmgAIFCSzvDoMgVmDnlfO79Q1G2npK3wGzBiXFj2lKDoso
echo 3D5cSmFTEuvxFLK+6LICL2W5NakOVd2Ar/N4ygEmQ2CN90yL7D5D3p65Tcrma1tK
echo h7OfrrFtdhN/YAvzYUCo89frauPk6Abfry0ON33H/j9EPh85hZCKQPR3D4l33Red
echo 3nmOLu/y0zupysaQhkjQxx1PjHZtHe+NvLQG7ECXSRjUQsBPI7pGshwIQUVD1ulG
echo R/7bZEIhP5mWMEGR0N2ELi+OGfNw6l+XZr7Ky9baXilMzeMKmd7v1k4YXhBy505p
echo o7zbtal0SOAv8MItK+b0ISRuAIE2ts0VSZ1yL4GB4cv1D1U5JeEDvBJUvhT60Lrk
echo WJpHIbog2LJjywIsyuK3HzxXGI+5yt4N7B+G4qrRvJWvPj/5RB25rRaQ/y0wUVOF
echo 6dsbG5Ppsc8pMX/b1rKS+GxUe7bd3WzLF2yqtKWDys18i/5J8Kg6nNbmQGy19MDf
echo 11hfWSPlmR5zMqRt5aaDkr8l208wDmPNiiPzxxrj/1Aiptf9pRCzf05/knJjWm2k
echo X4WVLplMSG2/NSWzzWzdqOAW3y7l83m5SryN4T2GEA1j81IzO4TV1EcmdFp/mGbB
echo Zf7uSPW3twtQR5h/W90jiG7j+TGtbCj4WHxh9Brt39ENwdnBpj67N4TvxfzZfT05
echo GALxZu2R222gIELvXtPVQ73N1yqghe2J6RjFRyYG3yWmSFi9pgr7A6yp7bl6rDyM
echo syN2IOz6pkkaPtm1j7h5UT4Is/9yYYjzK/yXMukkCrTmasvuYi8ZlY6vTgFqypWB
echo DqVqth7TiM2eLqZgWYEh9wqm7GP/RIgIE2cKaNTbQz+jwdolIxU/InetFD4z+3hq
echo mCupjGt1cl3mirvhSrXqDT/09XEpDLG8vzY9QZsRpzRKzhFdgHXummcjPktlGyWd
echo 7vF35SJ5ziP4a2zmMdhl5pm1fDBI7BysB6H3jcxmLIO+s59UQ/Q6aLmeNU2DdP9N
echo IkQRkWecxRgZlPH9V1wh/NiLgYxetNJLmGhN0YSWcGzsdNKCbXf5OSfm/OPQl3s8
echo pHOclWxpH7QIStvi8bN9S1i/f5iUXMoNuV8gy/gIEzQa9Mry8m4SILHAYuffLwAy
echo UR4sPbIQ5cO1h+oSunmYAgRaDa7zGTiPnBXW46DPOlDPD5+E2UoQJGEqvo/1kNFB
echo LgIE20+QQbDkQYueNdPvSqLvYw40YOgFTaNt4Mn9g7RMnrjwBnVOpmD14KRmGjH4
echo illPlmb++cDbtOm0q/1k/mO1yKC2jQ8K+PXTvIvGQHiXaSsU7iPaH3iVbL9YKRKs
echo /M+vYCBMzeOTcih4P3qkBBuuhRTL3nX3xXM+xMffZKW4grQZjoAIEVzMYB5MiY+T
echo JmLxarS595c9Q6wdswJYkkY/O9SOQXwwLoZXztkCctj0l6Mt9PQ5/nXZy5kFNlnb
echo 3TdDB77TK6eeNa52ROdkSO8LBj+UlKNrE2OFaP1pDavfgsMUOmunwmP7U3ccrndh
echo Nxw7TsL4nqQfCWGqc/8P7eeTc2bGmjkGpsfkIzXLaj95J/1f2+nkS7pFxInnpzP2
echo iij56od9TUZBmbeIFgy2G9skk4k/3f+PQjVyMwEhgKOmqceuBoBSzjUENCqXFXuN
echo KQQwouQdlUTnkUMUjkaW8pqE56DW+jSMgqJbesWw5ma/tfm6+4ROQ/dlX60revLO
echo DNPZie7Ddo8yVA7XlyI59+TuVVZpiOyWDu12cUpDLPvW+YQ5HBPoFb07OZSdhycH
echo oYBBHLChl5r/gbZN9874m4bxDk1wJi1E3YnEw3boUAx44w2G3pdCR3gP4MPF2EBe
echo FYVPg7q3fApJZ4JYao4Vp9nc5FxbvxH53ltwECEimvUg4QfcIKQZkgnY80zrtvT9
echo QLWWNIXCdCsFKtMnzG0+mqTWFAGgMcbuQV5nLlZRjMibt7KUju3gQauB7EwHZVQ6
echo ul2stgp1u33elQ780pQNuv0bHgYyaaePj80aoNtVadJClMHszOP4EuzH/wWKxtZj
echo vwB3zezpWwbNwPcpfXmkkZehdNnKEb6Tgdvzxzpvuu0dwpIQ4gIEgdfeGbfQssS+
echo Hw8lJMY58L9rhM/+2lweSmwtcn9H0TLutUYjkMmkrdQECZnDPMNZJ6pqvkLBTuJA
echo dxmlx/GkHXxkkWdaK3dtM6A+AgRYchzqq+zMIXLcPg1+xwqMxJ9i4zBP0fzGNf60
echo t3A3mAuUxRxu2rPC3/rh77N+dq0Q6mGaZPyvc/+du95pTTyP143GPiRkrVhReo8I
echo 3JvnTyeaBDe3zz1MLHXgi/g0lywmAX/MC0ls9fnJ+oFyLj8zHzuFvpxH2koFTxgH
echo tHQ10/kaXkhiMRqeXSkh+F+Sn9dkq3YJrjPUn0S/dwTA1jW2Sty6aobn8MTrrXl+
echo 3z1bK2bU6gk1dNiwlAbyFGeqpHgXppieBagdNPkg8khTk0N/6NsK+YVqhoQ9cOlV
echo FXz5Nzc94EFB0QFL3+Em21fxPY0WAvbD90Z5h8JCX68LB5p34oo1nvgVZBnc/b5p
echo t2zVhJ0P5fJLSOVvLMjE8P1TAs/9TDw2Vbf7RMG4a2H1eu8omzbgIFCdwoNwsfKQ
echo IkwfbR+nyHfpbbscDamZPmp3xQDiQP95rrl9rOfKqTO58DQHiPRXnz3511E7vVfB
echo z+xGHXgX3U4GNq88bejshocu4w1hPz4nGJ7F2qgXFpr8QhWljJ1b3KLmrsnbppc5
echo reN2i5yA0dk4pyqVnyTaY9T36RfH8dTcFabF8pfpUasXR3HsM+i/2wNrjlATeC26
echo eslry/4wMrPDOTc9kqNLU7maJHcIkAeQ7t+oL+IEX2dDiW5+ylYOH35iKZLPson6
echo oh2GVEw+PgCbfV2aMfwLxvPYxX51Jz59CArI1CSY1Gw1OVDsceNrTKXzE3QNjX45
echo 11+JjLYRwfTUxx06RBScT1jSBNEru/zSlv99XTCQN2GtB+d4MTvXqhHf+Ok7KcHc
echo 2CezFQbabNCfnmOO6S/e3pr2ol6oPPkex+sgvlNDBIWwtMFNrhxsX81DQHL1LUMd
echo IPnBr66co51v6E63Zz9f/UCQjkgKXMwxul0O79phrZC1vxdcOLHPESV9vNEI8meN
echo hP8307kx9w9EC/zrqItovBYnuHy7vfU5QflRcabsi35exlAQKEyyppTivAHGXHWW
echo NXFYT41PmfQbtZKLy3V6d2tlGthMgPuVJIzbJtRw2IDEuCrphXbgdSDK+/y/NfTw
echo +VV/vo50/UBmsGApREAmD6wnDsjJqkJsW5iMG6LiiLyGRVK+A6x4VUFG60iUqCdT
echo PcgECFIQydLHxBNZP1+oyofXzI6bAjOMAgTNLOdxYM5qZRWv7w4TWzY8zprluUaf
echo UO+yfMMqf13EOALl6luRv04aOTFS0hhVexxqRcvO/jXYdm15/kee9m22lBRhXc79
echo 1RR/3eOMyGUKZGs9QxFGMruVaTPHnX/SJ0CufITBLdTxKW8rPeCrms4wt/6MNsOY
echo reLfYOXYsrLZd4qPpL8KQNnJ74h6mTHc8qS21ro/NA58Ba2EOwR44gz6SIv/pVvR
echo +VfEAQIpiIcjNbduQJGHVnB+F2V/yRLZzuC7WR+IP7ylA4WRyAtKLlVB3vSUL2UZ
echo z7011BJ7IiAvOmvf44YR8/mjuONKvGEN7GI1EL0XPpjTDbnr1PnW4y+PqTOrtg1o
echo X9aUL/oG24W+OFsxZThX3S8NBKZpRvNoyS5uoNmztG5rpMhzV1heQo75Jc9Bjyll
echo Qe6n/jFCT+9Vn0ZxLBgPYtfP9oetWm2xgXo5/gKCJAxJRGi1u/2Hila/7pb/+0TA
echo duKtG0jCXeMGjirbqxdoWfUPUvyo5yUjrX0O+4HwobA8vCddjk7HP0/PnXSCglQ1
echo MChrsmdfEnnA5fc6b1vUMg2kzqQQWtxKiTJCUn5AcaDKvwxQfzflxrn2ZoZaJW9t
echo dhAQ/u1lNk3IYo0aqRVG5dGJOe1mtKoSOi7XSijBM4EdnbNHxX+0mK2xmeLTgLmG
echo YM7Oex1/jMC7LYTQXJfAJod2WBsq1pI9+cvjUY1HFe6L9f2qeF/nxsHTGmkk7hF3
echo LPOJ+ie0BAlrFDBj4DlbgeKUJj+xv+xgKxig+qblD1vwJVVS+NSZvLwaoxiZo5uK
echo h0tcS6zpoSB42x2iUr6KQbP8reSTugzorFWcbABf8wTBaTVF1kEe1qHgsRmrg9IP
echo Ht/sarm0rWttdTxIX2DQAvU+yXEdUi7JeTWrbpDfVEoXCUogECQ1iq10a05z+NEC
echo TiDVCyo/KdqdO5uNKgJBgz7NNNk9cC9kzyjvesCdx80mm46/ZU3r56AG0FSlQtzE
echo 0drPEmO+6Kr3DDXeQwZQ+fH5L1p70kp5wgg9ANm4NKkawWHrXrzx25ZROkJ19moo
echo lr4f4gQlMlwwyxm/dJWAd60AINSH0x9gGAIEzK1A5K9fu1htucGFe3vYRWhMkYOB
echo 6X7lapNkKWsJoi0C5KRrOL8uWbmYjFxzd+5i/0C3pJ/lynunJVChLuel8CAMvqn5
echo ta6ESmJZBaXYwWP4TN2J5+AgRZ2KFrtR2M/vXSpOITriXUkxb6RFTnSiVjluKOW6
echo 5+kC7iOJj41wj+KcJjSuOa/f44k06hFxjjSeMFrrviHOj8AgUJmsDd0KStXZxYM9
echo ntWWIqDHw7ZwL1aO646PnOE+usJSMsO6DTRVALLe7ado+ph9oSaVjMf5f183WWTe
echo /5upwxW/A9qPs223tCPj9p+MOAvLuXP3orasyK7kfb8x9+gEunxlCKi9VDmuINqM
echo 3yD75mERzqvJCWSgtjX/kIcSLQA2l9fIi2qSMKNlCM2LOnlNhkLIaZ19XN2MK11n
echo W6lWZIt0o/9RQTYjXjqNNmj02norXARcZLwfCfUlwECEb2aKXnNCw7OjkjfzLDcQ
echo 7gxhUQECZj2bnZulVuUlYq2VdWxJjZQKIlS5CEc3RNc8LsyoLbcC1OnTIaubII9Q
echo GbQJre2vCeEPcz941bVdvNPvv+g4EfPSUIcZudxdXMX+0CfNRzhBmZC9wxcvZm0k
echo Af0HeYPSLgf8pHi7tFzQmf06ICBFb2ya0Q6uwXjqplnwrm6htV0Zke+W+j2v/jhk
echo MlGyR4C3UpboihX4a3gsMfTUe1WB0O4r9/QSC3Xp2vxT9L0tbxevQfue5swGB9xM
echo doSc/f6p//DxjPYm77WIiNaI8g7wld8oZO2HC/+sYtHYs+hPVdErq0W6OM72lh4i
echo oWV28+VkYAv+YhNiK5m0/tqvP91VDdSD4dC6lUDp/4xfHbOIGtEg76a28Q1jHVMJ
echo nGqwNsaNTBbesMir4XiWxH3BDrqeib3sT+oNH4A6M+hw2pMvKOQHlRsjRvyoubuh
echo t38lBWbNLDfPyQnVZe3HG6WqEjnMm4XxVnfjDzgsH3JHXM8sLCBrFfgjsItzi7Sn
echo cmBvo/msjMBDQHWAWa270znMwg3gcthimlcC0ZA3gXFP5hnDIEruF+D9GRdDtQwj
echo 8Ba+A26MKd43V/APfmTphIapBZRQzXXhwnjkzdref00Mmc/M9nJ3+W+PkMtXsWZ1
echo Wo/+1pXeNSvOS9hMjUhDvM4D1v1KLHKwECbe1rnF0aIXBlTZhuJsUoaOQq65L/xi
echo uN1KfvWPpFdiGzIIIuGLQdsrZICBPuiUW6Qn9E0uiQouulHRRsNHXPujK6c9bUNf
echo M7MDHPBu0wqCaQexlbRpPsbCFRHhS5eaS34Aj+WeiF9qVUVAUSVTB1iYl3F6ClEB
echo tzfVCrrR2UmdUyP1fbX6afblZgZBm31GboP2x1EDp8G45KAgSC1BTvqbSon6yb5+
echo U01aTMMM1xm/5dnJCXH9M7MG8fZIsvjSqvYlurRAQJmuZKK1N/b7SG8jjwsN+HkN
echo mSsMUHEri3QliPoPjXftv/eW6hDlFclxhlVRAjc+5mtj9DcL4TYyQz9PqZhfKJkV
echo dAXr4o0aiFpp7ge4V/vRg53W0ghoHIWDvs/weTRDg7XQPjulcoybhYVIrmP6JxDd
echo QgL64lN3jOUWLizVZgJS7YDvhAqQhfckKF2ve+JZIkG30ZvAreYlgXoLc5KWUwJh
echo xxJ5v/diapzUjtoQJyzLtQH8cCnM/dJarqHRqYWM3XfB1KJKwGoaA4eoy/yc5NWs
echo Mqg7y+ZrcnEvEtR/2zDXPGpXU8BNzFGVZr6vfg+58/h/bO1ljD5SwvLEPmROvYe3
echo fpoYyKev5dHdOzK7fH63l2v8s9mcy8kfymWzTd7W9hxW0jTnVK1T5UsKfHtP1tEt
echo 4U/FJKm+gV4SO5VwR2vKtjHvUSF/UFMx0FCkw0wdOvrTcgCBQidixOTnGf1VTEwT
echo WhAZv1siaOLAWvH+ygblOUq/zZSJu2l3yp0M0VhVPYKqFH7zfY83eEPjA2heWxfw
echo TzJ7v1NDN3ER+i5u3x/EbelXfqBFMub2aABAm18Qtj+sHqEHX34tRj4VjemI5T+Q
echo L2cWddqZUUfa6zfqTOfgKbqy/DoSkKG+xi4+aQ9dwlEAgSHE+SZH8aeCueOLhaDN
echo aiiVbWIG81pqlW7d2B39XExD31CJpM42U9/Vkog8Tig/OmHhDfNrwM8i8kI1pMQe
echo rN+MPJ5Qt6A1IX2n5yt/bJRbWFiQDa7bVUxByhts77HARknIoId3bVrcv0dnQiyW
echo 9bJLJBfXM8oCBFsBDVehdgZY/ualbXrXybobIWmauIuDyPsRvzGRnO7YCBNsguHq
echo t//CFuM60t7qaQ0Hk36j++//GarE086p2k+vCh0mH8dQvlsVV0MfpabyJk1M81QH
echo vblQbadFWgGszbusv+dMUUh2eUjlTDyw02v5aJUm5fMTUUO8RXyC+eqheWKSdf4q
echo qgaTEYXE/+PDNTlbQmewtsY2u/ds2bZQlTILJEhkp7HLKuo569dNvjjHzFkp1OiP
echo XHuX/fF/KzjeIHeD3qvPiowX0E8z02eqVmaoHXcR5Rvg/d6voMh1Jn+1r+cbi3yy
echo mS67ttjT46z1hZMU3tDfPvpxZ+1W0X5EWPSAv+fhemg7yfOkiVHTKVBhbnjhRtLE
echo yBEKi1I9edhcd0Pe0HYerAvKZ5rRkhn6/cw3Nvraae1PvUDb9DVg8gQlGFaZDbU+
echo IdlpDMndybY8z+sT61jXeBZn7GM+rQECQ88v8tJtRaQwR7uo9phNa9hs9z0AgQim
echo 4NThws9aifl63KvvY/HSR5AXAQJmOGn4zzqElmFMvPt3rT7bjP6cdDl5Qf2hOpgV
echo S5kuSPAtDCCfg9iO/xM3y+ySu/bLS1vFevxSkE0nbxIrlA3IvcpS+oWRVQ/+7x9n
echo ZRfGTxIUwGpyG7Dr48UfD6Q19A8KOJ3FtrOLfOsiAQIsV5ZT8mT2XmpRKJgS5jvP
echo Pw/0+9fp0xNVosS9MnVtTYCBNrChU9UgF/tLIBzgj2WV7O1eV3Z/btDF0p8Q44zV
echo r20xsUTgmHm1KUP7eDlDmIgRaC6c45rW3Zs1SkgJTXkTL6sjl663GDRdLt/bwqiI
echo S97qMSmyVesxLk6atjj8fp3dPb6k77oiGLmT0aeOJV1jHPyHLJbkTexGH73iay31
echo qk6p1NwttOj6U7kYGyg9Wj/zlk7QzeC2jPgq8Y3eHaXwN3b/bKMNYXzkZrsyjZZM
echo 6ztj0HKF8wbcd1aaZk5bWJ3QfNhXD8i5A+lypFCkpRo8Gv8WZ7DbgaikH9s1xMtI
echo 5sstwy6MKV9ikz6HQy34KkcvlR0zMrM82Hp6gECbQJB01aqV8gmOmNIupk62bAbm
echo eQC5jj/EF60mVfJjR/HmdxJ5xw5Tw8QRhdSX/EUkx165OICBIVBa/2Wim/gXgfhy
echo 3fzihCBpCLKAvMOqwwK9rM77dLDikx1pKBf059jPRKI3vcaSwPJntCv5v+el8AuU
echo ztIfMe7PUBfpLMtIYc02j08VJjTMkhfNQRgBAoTl6BmFMGDt316klDCd2mtwLa4H
echo db6u8u7zn4lg6bV8fQaSv2H+ux8GHzSkMQfHqh2m2Z0GtB38uri+X4vc3n35j/Nw
echo 2qGY3sr+pj4IIPEfOLcK2ctK555aQFqznTEv4CT7gECZl8/Xxl+4xTtwl26DWKpz
echo v0ZBZ6jBMvQdB5+PxbF0+tAIEWnFaT2dPn9mjWPcQS33mCH+yLhmRE1TQMoBNMT+
echo CEnsBAm3h37IsUtBAs9HvR0an5YWtglcG7tivMsZ9xdb0+dW4K6ArZMNxXYOXG8b
echo 3dEvtQ7X7fARfVj+Wv9WGHwukPHasFKbfI3jvKisAW1RCr1Md8oZVFZhg3vG486/
echo rlFUELd+Ki70NT2R9I6CxTuGEGyO29T6NqKZA2ki1/Nvl0EpXdPdl1I6q++Yl0/D
echo miqBVgFteUY4W0qhR6ai2h4J419SpqthTapaKphA6GKT9Qav3flP5Zn2HMs2f83s
echo fsxGRcKTwwVSx7Ji14XjkmkLKxWH92NZtEEUDVdZtZ95ntJVg5xJPE5D0rUj/8EH
echo X/kuXwBto22A3YhYtdwKPhPS8vWQTeRnGtg/o+sDGD/BtJffkWBAmUNM9w1722Rt
echo c/tAhGyTPJ9nZLcz6yLrRsa/l0JdSpEBAnxx1FUszHnuJCPritf67p2/U+V5ICko
echo 3IjnLQirGXtxwLREfBxHapOkt74tqH8F5HMuKU9Hi1KdEXssfD1m/gQmTruhULIM
echo ARAIEzSFSRbbBzvBGnZnBrKSAF5du9JnJv0nazruPDZCiu5YFykqvWdKb5On68G+
echo g1EpSGfAZFQBAkK0w9EQwdxUOXTVa9Db8F27aWZTbZB1TXGjItdL99JP/+oo0B+z
echo boPO3wdKqo0EmAl9W/PoqS6fu+B/khNt4u4z6IP3iw3FrRFWZWwEYA281TBWZaBh
echo hYNq5NiLcV5rquOPqWvhdMbZWl7x5iyDv9dYqBjX2Mg+rkGThQ42eTkgFLgODXOg
echo N9n5Ea8XVZfmI3+3cH+ah8N8/pi4e5Kn3YhUgxSwkNdt9ksYKow3DfukV/jrpFFh
echo NMhwvfKhsKnxT8XRWbLGpbOnbq6/shFA4HyNPHhKq/8RhNTykUn2ClqB2xXu0mlX
echo CfE88IZ3dkX0vtJgF/zAvv/oEtQW5aETNcsft5+aZbFjTJ/2gQu1uFQ/8yhVFIrI
echo YCeIyBgbi/MG2bBZFqyGGJQVBtLZlKXcnUPCcQY3vH7t16BzsXdzbnik2FX3b7Om
echo E0pgHdrNk/QgmoDo1+vV6OaG3p4ThMmL5tzPgqjTqRgg4ECd1CwBAixQRE9/wFcB
echo M9/+PAx0EQx9/McW7d4crU1TTnL99Dicf7uU8MS/5l4eOoQP3/bPUHBA5SCg8nwu
echo Xzq9oUPx00+d3jhc4hf7YlS9ZGUIhXkzL210pnp+aNYhdBeyVUJXC7GQF/zAtUc7
echo RQK4DhgPxBiD8LT4LwNRwd8h1mYuqQg+7DcZ4ORL5hD86bmoBsD/cn28tY2uAzBP
echo QDtqBZoBNQO3QqsBkpokSrnbNewwiQb7J21gneJLBNkViDvGYNmln0cMIVruMUoF
echo CXZi+TDIyCkz//+ECZnId+BcikdAuqbtETVznRNgE70P78k+mtV7WxcY3GkaAQIt
echo dcHdboQyQopt6yl2Go3SLcJaQoWU5XSJIGTpTs55KAgTaxudLCQXHYQn4mGulMXf
echo oSdtOO/28OAXBBS2dDo0Sh/yhiyl1zObAbUMbQKoGXw2o6zG+jVFpznqYbcgkcxQ
echo +8nQ9GKmotDarw9/tlvCjqO0VtQ0TupZvtJIuQN7vQON/vp5/sogzVn2HeB2Y2tE
echo i6KR5l/LsUUXHxSwTmWSr/oekcHoKQ37M0qMPfI+VRSIJ6wPTCIUNOHWT5YoqQtD
echo B9fXfpQCBFgXKAF2QVETR73mj5UdxOqIUm+hIqghqkO3ZgmIZB1VrWn+E37YXPfj
echo qfkItxaR3Rn/3KNSBej0zpT7mZmWV5egJYu/CKxwGNRAIEzbbRa3cBWVDOYDZZm7
echo Vqp3U5f10YvT3r00UNHBFmrwbQsLUTtWqF95mg+BekdS3wSmVuNqfazJwUU9mojy
echo pnFIkjAVamZ4oYFisHAo+5b1Gbh+Fs7/3Nf8v/evnTOH8h6zCXpp1SdM7jOZwRB3
echo 4NapKW5HXlCMvjykxYoo8c6TKcmb5t7CnX6CO+Uee3dfwDyqlQ4maveW3l46fT+8
echo nLfHQnoWd0U727+yxeWvIPKpSwCBNo/T3oFFUlhBG/vmz5GONtWzhy+AgQpHEd+p
echo 7QpQ8E65C2OE+Slr7n8OAgTNL/QXzCt61Oi9iZI0iYtieDcgcaN76BF9VMMozvU6
echo 0IFzz1il32N4HpQAkq2hUP96D6elSAQJC0D45S7lv1tKiT3cJci1/oa+B933nRcx
echo 8xpeLNZbr/6Rl0WmbPSDszPcfguLjYRypDwPtd+75TAo3/8+WqBl4k2CwJf2u0Sv
echo 2PXDeGl3ofdUbyKTeb9oEX8+UME3RSncI4EaHGMWL80tnsE/ywwky8j8n6nkaWoG
echo 7Cm2KPTBmxz3lavATT975jZWvmtqhx/ECEWCKnCPbJ9qKZ2/9B5dSRCyCr26/uzB
echo e0tmXPdab93nVewzqX64leLZ8TG2U27205rDWyjUCEdxkFLUSQN041sanuO6Kfyb
echo wvCYgzliqe7xqvFafdMnXz5vq76QVmUg5/bOVjsR+2rHF5KZOizEJxjFY5Z5P5au
echo QWBWv5BT5I3263qWxRNT2P27QCBM1NquAqkcMT57CKVDM9kqngMKB2pc4bd1gfND
echo GqWD3V/9RQTas0sEOZpyyNYFcXGSIEOc6rRnK/uO3VCMqmsEoVWKCMQpPmjuFQOx
echo XA9gUT0ybn8EBweyXyQVxAdOjxMhbIT7py2M5PUrOt53c5g7rttwvfVCVW+Tblbw
echo 0H6mfiwdz4Xx5eXd3g0eAkcdrzGoQDyiXP6kZFJ9slTdCjEh+cpdf2BwnZ6J2E7J
echo 8FfQ0eFen8RSqpG66xcfTLFml7Q/qfU0PM8pRxYyjxZ00HUTYP/t4oXeL429XmCD
echo F5ugPxZWXtWUpsc8bsNoHzlR1ORHSg2uuW6IMm2R6XeI4ffSxDDktF/bDsvfgIEg
echo rKf1uuN0n1H/H7J+BQfebApLI/JyrDRIU43vRTeC7Mf22XotO/P+aTkZQvBoGnEc
echo isSyE+qBtRf24dvI9fJ5dSAgTa5nN2132WAh5E2miyB4sjvkI3lAvUcXVUQKTt8u
echo anry+hQ0/EMEC/PaZII/MLUHm6CtcHfHcL2gKNhigo2PMKOoVWFjPxM9mnptAXfy
echo 9/Kp9tVpg2nJrgMPdNAxQg5Uo3v8CM1+9bEZRum2k9pcLqSN8EbrnpBs9puCbCjS
echo 2iZ6zLzr8npVA7WYKlj1EBAkIfLEaRd3JDueWqwGN9lgYTbIMMk6/kjsnPCM51q3
echo Mx/bpBcePXUhdstEqZ7HU3ZEHNYrJJwZvugt6Uj8BBnFjQCBFyO2AoGOdpsY582M
echo 7435O5GvJzN3cTSg4Gp97JsoKwbsH1yU8Tjm2Ja+7Ov+sBzfj3LVqTLbrgNVNpxm
echo kE8Ib/g937t0Mbo5Se+JP/Y8uVynWufa/pdTsfCsyhAHz/Mbc2uTvF68wuQCV6nI
echo s68WvrP96ookSBEl8gefb0DrWYP3yvQbOTrm7YWqOLXLh+EHnzLwrmnY5aMo4f2+
echo x3IZvyfaJazz8qsbk0v041l/HE5WQEdaCD7Ywb6zBs+fXQh4UjMhb2lCw2teegao
echo ieDqbIHdSV0N0bnqmCsrp0fP+0KSJ0/lP8PF5t6RpfyuIZjmWdSU3+IEgPsZuqEM
echo JlmGzqj9JUDPomBkLeQECETFvbkNu4OP9qHx74dx5iZ2hDeAWfWOV3201H/WKhMe
echo gcL9y+h8L9ACBPnNWZkWtedq8tLLoMSxW1llZ1226CK9JgzRY+3bpIv6AQIseybb
echo YxhMKaj0gO+y0+M7iwGE0ZlVNM8Hge0auiGgIwECbUCpaZMSfP63w6Lr7xRYIpw6
echo xPuBdaRtUajRXnEbQzT7j18MiXfQ7QBTiwslSK3r32fpGg/xywthOZ/392hWSYnN
echo co2zIx9CZT0JZ13OG+beuGTxa3jqHszyyk+nq0v8RXF7/Ir+c6Lxz+3rw2YZs4SE
echo XxKMxDWIqJ7ulAmfgIEzd5vMje3nTckMs8PB9deV7plocaD2qfXqiefRct8og3lo
echo t2LoqO0IkkMBe6o4WPa5SzuMH6IP5ZpF8pdDBufViqznuSXGd8iKDdr4prdGmyS0
echo 83CWneidMLoMNPsOQbI6125lxnTBDBR57L64rs0ZiYioolrffrL07M9nYskdX6Z/
echo +3Dsfk4qDZgU0uO0IZlGjFNJtlNf5jjVYJ5zMY74JHtdq3n/Wz52d7K4BAn004sa
echo TTILGpV2V7qitZYpuxZAv2/8fCnjccj4WB8vh/7QIu8w4qvFqlAcSX22dSuOPgHV
echo GctuMKdF3UlS/q/Og6LoF/fTF6CRdqfwg1Cgi5mSx4b43XwQpJ/TMnptAsrSmcG8
echo dEvAtVrtz9ITwfei5oUqQWC1xQNBb//4RMByVghbUu7hI9CBrIHUnZylxuiSlZ3M
echo 41JT35pcTFvAr/lq77wi75uTmN1fJB3VM95ZvJ4f9k9M9xBELAVVDqW/D9oE2WV+
echo DwhR/u74gdFWA8tMjYKneLAFuYQmZIo7TYV7jzXQmAiKxbDChKfGbeXr4MyhFqCi
echo kTxlrHUXU2cM500l4HwT/oxU/OLG4TE93JYVNUXx2RvNv7udG0hAgWsjchvocLjp
echo 1qNWz8qt9P1P0dw6tp2L6cI1fGg0qsRSMOLyY7dWykdfXqnd4LDWHAWGoBwRrma+
echo HWl+O04TFBHWbJQvyynXU5Eijzn+ephbd2zYisOiu+bkcHf+69D9P4EGrlDcjx9/
echo L9uGo59dfgxdq0BK0p1mF92bgYwNvEy9YX4w6paDdM+4b2Sm+5ymyTe+d39QIVZZ
echo Z9vaTi0zkh+2EUCl5YUVenWAQJm/StEQZcjmrEIUK/YikD8CNDDyUi6aKUSJ77sw
echo 1ipFQBfeJ2kTQXBIFcTY8i0nn+mRXNUGzCdfBryn5mFXRaZLWXecr7/9IUMuAbwA
echo C+KPD8wV6iKJu5t8IK+QbgDSSHvV2kkihQj4oqzOpJ5l/ECKnUn5ELSvQ3WI6aaf
echo 20O8hrgjFLgRENmlmqDzGJGVsgFsh11xwfGrvsJXxPCfXZIltACrH4Px2QZKOZc7
echo bluKIAgUJDtv5ScOEppq9Ooj1YPNwv1DbDgC//C4eRpjvvQVj1rnqPI72xDInufg
echo Lj6XdmfCqUEzt0yBp+a555VtegfisvjRmQ9fmVki226vy+d7gmv9mX/u6UZufOlC
echo 5bSNziFCScjfGoCE7f8chmps5wq7Q3mD9EolEv+IT804HfxK+0DM36db9Ixp6Wsg
echo SjYPaPqcjybfNJjlM2bgl4ktCANmia/Fsjrwdvzn9p5uKQYIeZxAr/Qe1svGXKa+
echo NNZw2yxqA27wb8ZsHh5ayU1KyWLXMfQUVyKT1c2AQJAn7A6Pee05o0azXkpcckFR
echo Myba+Jp7Iu/puZZjwwg0wLSMp3UJAi7FqYhumWSVaXUigKcwECEs6WXWOTo7khis
echo Jw5SbPw8ns8qsAgTM0jqLfmkqsJi+gE23goI9Sn/3+XsSkTCO2y2F1SSGvMBb49D
echo Fp4Z3ZlL1t7y1V4Enc6a0Q/l3Ll8RKKddQZ3fPXbjd9Qv2D+LOXVQhUtqPbY8uEL
echo LiAIEX87U9z3wzj6pmT5vuuAkcs+fZ+yaxEEv9XUQX6ocHkkBf8bYBlqJKCNUYdP
echo TNzz1RgtDJcSHuyAgQlq2fmAv8lDpcfVmSvYnHAbniwNlRbAZqD3qI+NozN8kLHi
echo oC7FWQ8n9tPaxeMCb8lhrZY6/yAgSD4HCWU/7VeSFyHjceTM3dL80aOAv3dGH5pn
echo 4Q5YHVCar8VMvniz9lSDSqqbcKEo6XbtcxX+3VR/WXSB92XPCr1Z+tbe43Mqv6VG
echo 4gYdmOdg7N9IeEfGymodZHicYnvgl5kp7bbG1VtxT/7ef5JJGFCdRcuhUGM5r6za
echo U92hmAewJ9qQ4Ry204EZXRkC1q81hijeg7ewk0tFFTnD0VcDHVB2VewZ70jF2XMg
echo i42XFTSkScNfub7XOJJ3VPrDv9TDsDvNZf1Ai1BYrSUa3LqggkrH6rcipCiqCXfn
echo YPr70DsFo+dpI7ygX+iS8yTRQ7LqkZn4wC0loDSctGB/ey99PFaPfHUuNBusRwg3
echo jq43iox2M77wRxLkVhmvXU03+IEInScllbvMcqAgGya1uyZ5YpyTdgWYp3yjX36w
echo Rcivap1tkJyhY/M73ikQKl8vrbtjU32m6L3eyMRfJgA3Y5YSTFazrXpwzuFOfwcH
echo et691Ve3Dbq0tsb3B+ih79bg+4CBIO4cgs0Ab33JY8oV38oR3JExfm38v21617vx
echo 7flH2XqipJXLReByOP4gIEzWPFksj9pDSQ0E3ekO5/oUajnz9D6Y9cjZWtoqdLh2
echo gC8U7eONmdFIm0+tZMrv5CpHtMWp4/M9S7j840wyRnLEKnE093Ct+Fb+/YE+3IC+
echo hhQOZu5Jca2pd331nmAh3Dpnuq0Q5zE/RnbjA7LVw17p4YjE1k7wOI3ueEN1mokR
echo QHj+Wx2E5b0d60e7/R/MFo6mytm8Ew0v3bb5KVqLNhZMRa+kAgowPiSFLODdabhw
echo ncEfLSou86Smsktn/q6hCmtF/pJZcKv39V9vTjonyB6EL0E7ERDalta9rlc7TmIq
echo 3hc1P4xnhVJHzCN3pMoSMxNHvfGjAR0DehxBxQScPUNjZcbbx+R77swNoQ6wrXVP
echo zVN9L+pkFAbOM2IPPFEEwKU5Mgq0T12pWxrE8+79GlZLBc4dV8X1HXg4f2gRSLQp
echo g2bVT98mY+eRVV3ja34FXfJ99AOs16GbyqNeV+AtX6KLvmiWKYjcwVj8SNZcqwka
echo 3gZqluUGWNnZ0aqEY8VzryctVcJCIQCl3gNd7fqDdZ0aKFOHqO9gX6/BXWBADUNA
echo c1TfrYA/rxEumuV7Pvuqq2M6YB+ISkZm7QXP3JpI59qOtaJrbFa+Q1BFGaMZXSim
echo Rc16OIC8qb02I80wotlkJC7Le4J2oeCT83dsrMJFFKIhNeDwbV0sUMIFsnN5lhwu
echo ANJ1swRGh+cp6AE4EZQa+//Sv6xFTBs7oxRySO4q9KznyQ3MbOAzqD3hvIvoAQJA
echo 8PsokmQ4MeRtY4zhCPJCO0j67sUtwRy77KBcZ0I5ggW1LUeo+p6XcvtR+ndx9wzW
echo XjPvwECFK+j1DC7841xKlEfd9RldLLetPmBfxwexokJK2UKctaibFltQ4ktbH8aQ
echo nmY4K+mRM/aCsUpkuLg07bQHex2LbwRljViax1WM80CxjuKBXtxpmmv0S+m+6h33
echo qXgaTH8ve4z1o2yb21hfirOzxDqZR3zvxfy+zzvJ/hzDHoGbG/IBpPDpkxrwN0Mu
echo MP3WEwzc1DYNelqXnLo5RcFIsBstSxlelqDMm4FpCVtPyx+IduNII2hftXv69oTu
echo 5DjTkofEf+ooJs4rS+zwu3fIjdwVqcYYDiY96p5QECFMt9SLu4SrPvBqJ2M5qJAQ
echo N3T3gfEn76ysG2G9t0avt+CFG77jpyUD2BRM0Rof50YDppGtgEjLvp7NaE9WFQOn
echo 4t04PCWMb+ik9wF3rqEHwyL0gUVjC/izVhZh/gv4njsUAqR/iEFor193uNfr7IJ7
echo cEwS8ftMz59pY60FuaPZX8wfnuHKbANuBjHGNG7lWllKurtZ0NehpCDIThnwr8wv
echo RDT1P83nIdo8G3mLjrs7lzczmcy30M5Sx1O6ycZ9F7APE3mkzY+iOCulQLOHiKSt
echo I6Y9tbvG3VkDehfsTKtmFhouLz4eG7rvg+N8jPgaW9b2l9M4McCxSVLge+GuAiYD
echo 9JJr6bX3nPc7hZRajdyuvH6LSmzZj5cL9JbRtYj3dA8u2wwk8dBWap17qKEg+IEG
echo l5KPA8nFWmiiXto40angDfAYOQNG7iMISO0zIQ/0HqISRdau+qWP58HIgOD5hPwH
echo rNih87fC/Q63fBvIJMg78nPyIVf3Lsn5rPQqFNIsEzdKTEtJC1YrGSkyqm0df7/E
echo ChED8mpE/eciVuljFDBp9cvVifzcwLQculvt8xGCwvTYmRna81nh2sOyrd2iz0XQ
echo Ui3f1va396gTbXSsKzrU7V82Ucm4s7lIchDIeDxZJXrzMzKFnxdgksiu2Ny/Tc61
echo 3eeJygFcxULTT9txjFVKqFTLv9XxB3zNZKkWxyly8ts3127etUxREErOKVa/NBzA
echo W+I3Cis+wHqAQJBVkQuUiaT0v2L5duMeFYTrVa0gv5ax5O01/XJYa468P5PfWM/u
echo P6r1+MPI6lR6SS4idFuie6KoPf5Xs5kQECfSyWZUPlxu6/1J9FGiyXYS8uXdIRcG
echo 3p+DVG8UZcWcX/6igm0yisI8703pGoFc/JzK1zn8qvFBsj6ykjHW31vO8q39Al1P
echo um3KUQ7aYNmA2U0rOM9qWVmF9adN+NhuUtTVUv8FmSs78mcIJdIezTkf2gSEB6af
echo esrJj6rLG7fZ2NZx6CxlOgLg3g8eVj9LtpCq+Yyh/VH/fYt/f4I4e/XC+Mp73FdL
echo V40lJzfae9LlZ9Ew5yG4j31N53T7+OK9LfGMr2FkeVvwItqQs/3yRc5aCGNXnywk
echo LspaCYdv7ey1oL8Wle+cjMkTdzDtvep1pr0WbX5fsfnqv0dKdC6gIEXfFJviPli/
echo s6OCHSc7KHa4OpVNdqN4asuXNt98VhaUAvnLzuMMDHOQp1zPEVsmShpH2sXwfrHf
echo Hp+CQzsfqjswDV/9iGWEOvpMbKsgkruUsN0+s5bmKs+mgCBCCReTrwuJgw+ranUe
echo 8A/SFuUYBvKDcsaqC7RJkMe4WYUENAUTLLwz/XJwhV5wtfvPZnUD9FPgCBIHvlxy
echo RQjWIaajpg/QiFjohbmz4BaEWDky2rYj8ZpROp/w98sft0KyHNoFKk6+ZIkVqd6M
echo ePp049kTNlnXD+MQLER48WANjHt8VkM7OsP2Js6bFSSM/ui6P3P4v6ZaG1w8nJV/
echo x1UUVKvFlEpq7W7a+eeANyBSuMbkKPHFF/mNnVKSVO9PQC5AJ8kt8k7a9zRyrwCB
echo Pnn88tvlfXpp6urFPjMi36IXpefhoaiPoI7iN6xKgtCEC5Xo1zKOSEd1PDyv7Np9
echo s69M3JTxyMHqcZpREtuzl+LIO9etmfoug7MnZg1GBVSHmPYJY13FHFjrLvE3CYNk
echo 8bMMYXmWO44JDZviMPVSb0qyyvJ4oJk8EUMwLDgu7+jQf2gSD8Ez71N0vzTaXuW5
echo g3tQ168mkeAIELNU+G8Z/o93ZMGOYWurEpXRMfzAIEzcWMh4Cgj4cs41BX6Bku4+
echo MjZHGdFCBj4xA3cQyy0gbIHs0K75rjMBIqpOfEKPKEzfg3hkl7J3/QehUmiBdAJK
echo WFUg8ovPN6JO6inTDwTw1fIoPXr+rpCBvmnZRWenjSYLzfwfEsiA1bbGetn1z7hM
echo I5ou2jVhEPoUGs4OBwYRXTuUUDaPtmpXmWGZoZ77o4LYJ9/MlYY0hDmaAgSCfXMQ
echo /Er/01I1f96V3mdNTMDBBpognVUlEKsNPMgzgAW079rgI+H6Yu0VewUYK88cRKLK
echo fGHHERpylszxlcWZ/ef6vaObhD0vvuV1wdsMTWzyWVO/GPP809q2zXMm/ZCB8Zqb
echo XjaldUAQIWyREy5ures34zlfGDG2ki4bnxyAgTNum/sHX1IZ4lnpvfICZWZwDjEQ
echo pUUczEKv2XroI5yhYC/4XOFdhDf8hftPp3kHvIZes+KlhGg/zcq5rJFYOw8AQxao
echo BYvWIiG7/kTt45hHc9Lt8TqgPjFkK+pchX3FfzCe0a/HimY3pXEGMTKfDPm562HJ
echo 5lscm/CygCzBHWPl5B1zTfn4qxnZeTyIHCxH1Yc2ttAY4vInDLPllZzvddVlVap8
echo HQAhoDmjNs7Ftb+S1+mlhaHmGZluSHp7/luIkpdvXYQ0tW/cs3tOTnJ4Rpt/xo0c
echo SkCWurZqo1VdXW+wo53Z4zAECfW9xhhl7qaAe8ztqiw9M+eeEgPR4BJmNfUSZ1L1
echo RIwZfy8UMay7fs27bTeRomyJPozE2KjRFJ7TpW7w8gccZ8p545m50wgzOKmCxDOd
echo FvOXyiTjS+gnzfw9HXDI/MihxoHZanzL5pqvm0MMCLdxGOPpX7KrotwbCJNwtts+
echo mnpvFb0fX92ezSLspyaUJIR7vV1bI608JmFI1BsN5ZdKWg6ju7bCni6IBk18/MPm
echo 1b36qKw0quyEsWf0kK2/LZM9GGGuG73vF/i58nznySIc5HKbu2yewTJBzICPqGaf
echo Q/EOC2VsQTeOIcD11QDFP1VSr7rhSOGeZTkgkg0MLojH2/FZfCo4C/HOkx+CCzeV
echo nGRmS9s6aLCyz7NGXRf2blFDX25EO7hV+Ox5XNOUcpm5fT8kXNKtBSCTZDwB2+V+
echo LBwe3gnOUhBuj4+e46Mwqr1jpEEc2GfclExNHkWcNB6H23SyVtY0bNCXHYtCvVRZ
echo UCbu1mPPNkV0jqVTGGDmDakOzyP3Z/nK8G/C0t29T1rN1DT4FUpgIEIkIPiMJrax
echo JpnETAhuZVxdzYqDbbDZ5Pvk7vLXwcT/Us7v1YZHP51oycegMqLU7Fg1Mfwh78AE
echo CKzrpTMhZZHucJBtJ9Xw7ZMogpm65Sh9Of5WP6UK0jowG+CJNzSwlbFESg6iWbzB
echo x8P4X6GSRVv+iwSUzHd9Aq5QLqYCm1ft2mGDewrhhqCkTk/F69Urkq3atucp7t19
echo 9xT42rkHYiTN/W7g7Tj1GwgEd4a5FXINLZaiaiEoCiS5goDfcQ2Ffx6QEMJ1SmlU
echo 56vFfMXghOX0b3ygjvnKhhLtJgF4rxChnK9TiZVcccb30GYjT0rfRgJx2+R2bIQb
echo SjdNYBf89kd4j0jXAfTZfJzDZCmjxy8asfA3RrtAd1+ru+DqZlzM3j4WZmY9Gd0r
echo 6M1b6fa8ETBoa8ivg73DoFMD+M7gSHuQYhK+pOF2IoO2SxL/xiOZB7gsizZC9VPn
echo ajDHTX80bSLwFra/JzpXHhPmL2kOsjaS+W40UTYAgUS2Mxt8k0irSAxx/SitUDMC
echo ndj9dmaNe3k9b2G+al/WCAgRW6PDPVyuC4KPqYfiEfKlgtZl2OKoZTZriBSzfyIG
echo w+AuCHgvmf/wc6DwmQFmpaF7BVlTRrlpXsA0ap6LLulTv+NensHOHFih9kFlHHlc
echo xrtnrCbw9sLWFcPTmY7tvyWa+OYwbTQHOuB3XsCEH/atiZ72DlaY9sKS2OaXC7G5
echo +TyAav/se0fKQl/H+IZ1l6l4l5JHYsbyzWkDszrRRfWobFCUmZRUHRUa0CuvjuLt
echo cgvMv2EdpOtD5rdHwf8tk8t/mbKN8Y7QE1lQKW0bhjU2q+wpbxY3TpzST9ZaJ/Fm
echo 9Yyx925XbvYOt9tw2Om+b2wveiTbVtRCnZbkfUWswCBQkv7awqmXJb+SLULqKkoL
echo HhvDBeAXifS68lEi53mm3y0ZA+y93pGOxYxClAoy1h1GAcC6IG729pEOZTeuL2Nm
echo II9mGeupp0DGc1S0BAhE/3hZuBc7ySHlb5v9NxIDKgFoNtwnSRkhy73nQNJujnKX
echo G+Z+aGTdhEjoIhcEhWZc/HYpU3P8QJBMzakbh3ZM21cncIt2443anzKsAtvFE9Yt
echo eAj9kxTJ5N8nFbaTlPmZ8VT4uR2LzUeoL7qH/vLhb7FPe98fnmrre+0zff6xtGGE
echo dimNre+znU+aLNSsG6jbTCEc2z9vhCapAgG1IafU/l9MgwU4+BHQa5t08yHwUwbP
echo h2mJpa38MS8qh2lDD2+j3ppKkDuhP7ZhuZWac/6HsJOJMV788V2B3cU94MS/g2CE
echo 57+0xwSzV/drbXV+gos2n0ZvcnXM/pfZCv2QI8WfTPtouhmUuofsOZHqjfPlt46P
echo 5I/XjWPL8w39+vCDPFvvb23eB9V6D120Fo00WFOjm/aAQIULcbfRrJ3owHfv9TUq
echo GV6MqhvPgXPDq9bs1fLBBOwZ49UVSg+TVg5+NdQ/c8iFf1n60xbi87i9KVkks7eO
echo DIcxdoDPs239KdSLYE0PE9CQrgL/mCYeW4d+kEdQ1ySjLCtetA7/h+r/dZZDuDSu
echo MVCGw3wbKLtQUQPOmldiui4yveEScUTWOhRlsfyzzFVbH1kD2II/YqiNafp/W8y4
echo NsE3UsfoMjQ6IcuqkeRU8tyyfmmJ2eJqERLyVuQ4W1i1RCkAQJDTevxsndlbfCM6
echo hU8aUqivEpPiQL5PQZ/X1s8qYlCN8eIYmpk53XgWRR3ftnrDaucdKTGN8eZCGKtE
echo lhJQ1xFIda6X4GMhGgbxQ7VC8ZqVlWt4ZnLWedtG4M8lAy7QKyYFxgvarnehWpML
echo gECKgueRY8bH+lrfGWs0VYLGMlKZjqxfZCPJaWy/Ldk4SgLTDpluI4N/z8I9CCo0
echo oeZrggr1cyFfCh9JDGPErEjoN022qxhjVS+Yi6fKLc5p+lBfNRJNkhcHofOsuM1t
echo qbBIKu4ZUZKhtyvJY+64EzBD8lkVXYvQiXz/t6B9z78wZKPPaWnsJaT6TZjp3m1L
echo iDQcsJGzo/xUxR18dgxJpwWeITq20H7fZAVmZJLfTytgSXBAXYixO8i64Dv0rV+u
echo jOQY0cPes3taJHCyKpIWAmg2Wg6w5Q2Rq719/2m/Z0b/xa/APFKHM/aBCKJfSTHT
echo 81eRafhJKEdjjcvY/AO6R2stBJgm3negZptUR57eNvZEqm97kaP4C/4KPLTXCCbx
echo H8QIrV93HMmiryuyC8hPKeRcF2FOk12ZmSw8udeFmjvm5+gECbOg4J31A1PjU8Gy
echo uqi0v76IK8vgAgQqlvU/mGy6sLzPhCq5NnOJJU/dbAQJmq8V9WGCF4khayfPy61M
echo 2mxCwSWdWDs3kqQ5Af5eE9//d2qBs00r2rsL7DmGaJDctj3StakBAkMGjN9OcRmL
echo jl7DONzzwhOe79HY8a+/Co03fmpSYTOKBegppJAOtEq4nAyz+x4rAM9OnEdQdlQ0
echo Ind2UEdnsBMiImJBwAggIIiYFHAKKfgSJjVBMaZkyoCCKKioKjgBBRRUUUBwGFwA
echo 4RFRwiOYUEFTIiCZbOXLCVJYNmCy7H2+/nf3534OeLmtc1zncGXckvdbw1uq3usE
echo l4tP8hNzqbnU3PU3Ot9VuVqqqT11VVGTTh8T4TWk1bt5/ygEnpaFMbHTNRuNTa5S
echo acc5Ex/3tI3d1XOjXEz9UNqe70agzvYAeQsmnx6J8j9C7Pb6XsprjQ77Vm7rrtxo
echo blOPN6g62zQFL6eMJ+p990iQpv7e/OL+d0ahm+JDKNlRKb7N+BLbo67l3hapxyrs
echo bCtgyuo40JQvFpb/B1zVwrfQuT86W8zLGYZlfHR1Y968hx5epXm901g823jXdUk5
echo XNQvnjOZbuficdfvCzrbuNHTF6XTkNc1sRCwB1eZjwUn68mjZFGW25c4dBAe5JWl
echo yTm9Kbym1bJyed21Py8wu8d33sm3pmWeQiFAqGHTKcd7IS8eknq++4vuVzkLmkno
echo nqnOe/2e18OCuVPMiusNLWjVxrh6pEe/S0Xyzayuz5enrCFeaY8u+trK8k+UKqdc
echo K4zmefQ6Y27nrRJf0J7PHRC2ho+4e0i2kl1YR4TocElkUQcoCbRN+lf/SezNMu5+
echo pcn1r0l++Q2ENDa+Mq2GtRfc/qCX2rNsJXy9jp5Ir2XMbY+nL/pw/Xy494y3lnPp
echo eahLYEfUPqAitlAhEnJovoi0HItKPTJXJ52gY93nqX38Jv2ZJyJn0eY32fJG2avt
echo XjmcSh8rNfVik8UJ0fM2Z2h3lkFazBd8yWRQyw8GlEZfq72sRL0bLlttulU48IRC
echo gcc298JC+VaU349eIXUXSE37jOuAT+SpamcibbYUnnltfu6RIbub0N0SsE5UHqK5
echo 6px6djzPMYXGmTM6q0v1r+dxy3wHxpnDwuZ/ruTgIhZPPbOU87d4NacUE/L9GCl+
echo Zovl8og8aIpXVtpYa6eZPXLBP1zevfFVjZKLaOUrxWdQIP4lvUcS090i0mxOi03C
echo YZjOjtyp8Qt9/ZSD98o4pUoNvpqB5i2Ch4HUTY7cPJddUzqSqrKjhwj60ZSBuovm
echo 85m1hdwHXnbTdePAIUinNEanlZ1FvZaqx9qnNTBmVKqf2N5Op5jl9ZUJTUee7KYD
echo 6FL5uy6VMdbfWRSCpP8dV7HK/fs6jRPOcgYDZcmZ3DvIjvn5GSA3qHB1Vt09+z76
echo t1zFdsCZZ9qSSz1m+azrl6ZMAvft/Ndy0C1cR/4nRN+ctTad64dn/SiZ2qLUb+m3
echo Gk+KiSfTtlSg7nJZtt758x3rP52mFzRr2c+lEqzkqUr5x3xh7npxH40fpzWVOCr4
echo bGSP6F6q4Kj3e80H1+5XN4D1Pn6WH0ujgLTP3K9dUWUqWhyTZUc+clY2VA0TcI7O
echo GdzB3a3P4f+hULHz4HcldH32BrTbrHEHuUVp3L5c7BU2waaUry70esmdTchP3291
echo Fydav0NEw4rmaN30ynKHafQdzVqi9Chdc5lTdMuxWqsBiJZ7d9V2ixnK5KP/Jk5l
echo evP7Unfz3PkycXlvu3YGR0KzixXT/76RIWwn/Go55ZtoS2zetPlyXcuY1cb7d0lY
echo Sv65ZNYH/5O2510RG0X5KnA5hzeCJPo6p9czMbtQPKqYvTyiV3NgeV6Thc9M96g1
echo 96zqhnq2Wz8axgPSljXsr++bVn/DD9jfXtcUiGFv2U5l7Gd0ihxdDeclsugiFNFN
echo 13il12m6n2bldRDeHeJ8lEX9AIhQFlya2aQ6Xb1JaVOfKzmez595dhqQn7Lruxwi
echo 0hW79TvypbUdf08LP9CfCIU8gURBeoXrz9LXcT418i4HHMQ4Xtquh/FwlcZl5MYk
echo KPUwH7RGW1zqUdKpT8Mfnrx7+b0Tb4NCm/ZLTscSxrMo12ZJ8pE+xWfR32aNYvIT
echo 9z2XUHKcl/axzBxgPzegNoebf9nubXvZV8l7CZ16kSvQMT7Iyt6HE2ZdPWNH64ab
echo COOcduyaEn0OE+2e6mod1V6veYlxXymvh7CtskYxDW4t1W+jqk35Uxx7GolkS9xm
echo Xbtmykec3NY3up9EVae46/JwHsZbOGPygkG1Z1uVsJdkRa+UJXpG39uSwdhlLjTP
echo ItWhocTHT+0toEvvh5CnkoNyZlpODa6/Zys16+QlINsct6p+bh8mM1aJCMqluinQ
echo n9vfb7TID4t8pm00XKbbz6Kr83k0I6u+Zcs6hVZDDTvGXZI+p+cKe2RkOvJHuGMh
echo 4+v8W3M16QnUX4o1ltJPlin3VO1aelcrKDYXVf76mu/Nzl/a++6/er5LNFS+pXDE
echo kdtS5EIZmXc9FpJDneE56FKBh7rehq1z7+1aWXurTCT5Za+8TDLuguZat9SnyJx2
echo lqSANdUo8iWmPjpoDrH7BS3xK9xGvvF7ksqOH+t3VZt5vS34x/hh6vnfDWeqE4Zc
echo kHUjUwfehQiFk5DryUVMGJWibY+K/ugbSZ2kAtxHfbs1ydf6DXZ+lR3u4CfJyzBy
echo mhXydAndf7d6KSe1n4bWSF6yzpZ8HWnyfyNzvTBEIoJpEX1M3nvk2np96WkPcbq7
echo MdObHv8/bdq58slSI39n3Fow9fcnfQ20qoteRnzFrBUdXn5TsDvVvD/acBVOmTrm
echo WpYpv9GyK36vyyk817M66uU1nWcunoB1LxmiggjCG/JusudZwz72ZbrLaYXxBz28
echo 32rjZ/Zme3Ed9pzttybGdhBQc3+NNva77mq95+fX+PXlg3y5Oh4XQ1NEOrDWnqU7
echo io7y9I3KmnnM6VosIYk+sRVVk+kmzr2NKun6lZclsqj/rMGNU0IY2T11X8PvC+9R
echo qiTzUSqS4Dvbjouklls8keJDf1FF6SUlRoRCkSf0tQxTQzRMe9s6zfJ0FmF6RzVx
echo WQ1M2w0pqU/uqDhqgnrbt8N3Qp/f3F5m83u/Tqmzm73bOARCgNHnew07jGOz68hV
echo HHZhIotTPBYD3zXBc9FL+Uvq6ef75szdNrNm3xPgRCnni6dN6sxE77SIp0hwVMnf
echo B42acWKRVoqhdDl2l8We0EsPIWTssrWbeDhJvn+P1ZxrSPbU0iQnamljC/P03R46
echo Sz7e1tAiFNP1AaXTOVfqafkIjMu0qJeprt3iT8BIVab+qlupdhd9D8suT5zsf8r7
echo M2SJPTpVXEnnab4ed/UV1Du1k6PVUfNzui1cPKJbJuUJSbmvfJG4CIUikUb0xjHq
echo 3WdT2n0+fmxHkN76uoAiFArtvwkv9InkVeV49/lrSPokBiZFAJ9vUDGu58iAzajx
echo TPTamKkLurzyT6MIrDnLvmg5UVP9OtUWjbJdjxWI08nhHvzXNG+bfr1LtNLFFvZo
echo Ly7fmHOkqmSsXorcKvGm3HR0lDGRzFArUrJJzI58awkNLu6z1emT7vRvyFk3+ls9
echo soTbFpvcwp3bNOZ7mPkHCLo5hxYfE3ORUVKHY7oT5pN5Wo8CT1GxGV5o/KvOtLHl
echo 2XZln/Xbm0/P18OkMTWrCIVFdjWQCFvt7R9v6wsE5w6kt3nj7CEE+rLj+LSHHv2n
echo 15fo23m48Pwjk1YT2HodW42D4q+jWzRJ+B8K0102snaIqNoyiYdj3dhvo2mcDHm0
echo 8/U+dL7PxvHua3JJ9GIq06hSo5fkakteEWe5NaZyu7+56ncJYCcZSSF2IO22hh1Y
echo tzy2ucpI0YjYdCdqZr77nnC6uaZ+K9XIN5u7XvcCIU84qZmWb5KvtV+8feyyoDNP
echo yv50L6z1P341BS6FDhVLJRoT+TRF00soc7mdW4Sckb6xmo2a75IRCkXgS2rdfHow
echo lvxWE4Y2LZz8noORwM0l9jkejZ+TcoS9x/SEQsnR986vaiQ9zMYRX6STE8+s14tb
echo v/xNaXVzJvxNF7UbgaIL2hUV64sNumacN3w46TMUreeDVO+X8g8hQL10q/yj/bzR
echo XK8r9c20X95JemyViGq4xLWz4vCPKuqCM1MQ46nJ1brFEqJnXIhft1Sf5+he9NKN
echo XJk5es26F8L3jM0zH6097f2zlnfUARCyaavl9NHcSe9Fgzt2z5ucsn5mq9bCvdSw
echo q/AKhhpZ/iBCIU0YvDwHT4onJhT1oOIiQhEPJazvu4T3CI3HnPdJ7ot40CtskFy9
echo a7tthOc7n0F5JslLm2r1Iz6O2XOr/w5JL5MaJ33k7oSuQQkvb2LOkeN18MH35l0r
echo W+jHv39OypucWkK3UZOP+315kAnOOujFVOd3IzoDNb/HbzxyF7/X5ak/8qvd0CX1
echo Ln+GGPvaCOSnea7mmlXdVopOH2pkbhP+HiifyZdtUdmryPrZF+DlPPTqEJ3dkCzQ
echo nq5Nk2c9SMEQi8s8pY+LhXCfJM6D1oWaXfbXJGzaQiFAuPBS7XgcIy8iIZGqunQE
echo xp2TqGwRCmS7uoPbFjmuWWVW+waQx5NplpCbZv3Ux0hi34ena/r0JWA++Gblu8zb
echo l/KqJm9sqpGKq0w6qhJ7Cc4Ml4fYcaL78kk/NzqvPNKGHtYoNql5Gkta+HA3B86V
echo xJzuOvPzJFgUXrd/PF+r71LEGW8THSdsO+4ciSz2poXFSyvL2WAQpEo8q73run5R
echo jtmbTnPe17ZpH1KPf6YECry56e+G2M6J76ztyzhHzXK4dOF5hUntllh8nMNcykRM
echo 05xtnwjvXcd81ir5ulXdQ/YrMxTw+0e/52G3ssk7hn2v1DD0jb5U1Ns1I2HkKRWs
echo Z6JdO+tIraDaSLlC81Q4NqdmLD4jNn0Je4RPh/HgJPJmrAsjvNycyjaTQIVpZ1E7
echo YT+ZmuUSeg4rDPKKxSxLAbqUck+FysKzjyW1R0flLOqVt7IMlVk9vGqgRCyaUk8r
echo U1zHs9xJN3enYjWq8r4kstVXv6LG0189pFTiMN8EQppqeO+Z7R84M3lX9/pjrStR
echo ELYFvPHkKApO2t3EwVrEVovbSLJ48Oretrl0EQpkW3OwT7mjPyswd5nu5dwgbmtP
echo c32p7588z9JhXsSBAcYJ7FUaWO4kZD5yfP+J3W+3MPl18zThEKRa5XV/DMVx93f1
echo e9WuM5C8zmUz2nGdqDdfjo89fV+UiuzgPj1xdk3dWgZ1VR5p4WRvjlLzMz3uevA4
echo ZLRaTJb+V+kwOpflpNJ22nX8LY5liyXaaNYa2i8Scj5Yl2bSUGYhd1oDGYffHpWZ
echo 60dryTrtaf6zD5G86rSMsaTF+RCTeziffZaYzn02OYnIaF9hzGcW0VVKwf2WHVOo
echo fs+95ITy+ttoxHf6P8b3KNLJWQ8V8+FuVz8q5kd5i74JZQzKm/jtLAcJ3+un4KKw
echo w3VgmjPnvpM3drGK1HydkoLZ9N7bvErBN2Lf8JZ128C4OujelGWlVeCnV1Ot798K
echo 33Wc39OWankpSVXFZxd13cq9D3IyTo7K6TaSOuariX75XMqv0L4R1OnDVJ+YNp5I
echo akQyRMsoR6h1+6onmx5Ok6YRCml8vd6/hIc/KkRuT7tb0dxBjfASsFp+C7Wajt3C
echo q7mKIYMt622Jug980JPm/z8GB+rdTPDDXOSmr6uc0vCyj9ojBUnEV3T/PqpH0ZVa
echo c2YeQsnlPiNljtkZ22p62tY9pr0Txv3XZeFtHC9hPg6+D15m9WQiFNM25UChUJsv
echo lHyOldFumH1LPfsPsEQoCDmESkeKbuOjoo7HYyyL34I3JXvhl+ExkQFDKRtjxtyV
echo 8nRN2Zr7m7qOkP9OnnUXdtW5yiPC/ca8QvdfI9n3pqE+onUPZv26cPEgoHHVNc8O
echo zQ08Y6CIRXLyKmZbiSvSG9cxgc9a+budDL7jW8up5hhob3y8y+lTMk+lPlkdbzOx
echo zwtQzwbwk6XoCtn4uy2kXO83q/Ny3PDj01vmyT16lZZ3RdzvU/skuP7jXiaHYfez
echo Q941ZjAIUiX0Xz5Xvm+plPxOxVa1MG3cbyGtvfes9IhaCQgZrNuyeEQsnrsz+TEZ
echo 0mmdzZ/qJekXyy839HJxRhPd/29HkJHu6GoZwnvjNxT/nv3N1nS13sy/DiYg41ep
echo vDb5pT/d+b61DbW12THRc/S5WYvJpq2vd0tx74Oxk1f3K1QkLfl9qPbs+YnnQzCI
echo RQdb269hk3HtyyUzK+koOZXpqkZEnP+vzpc1AfmFlDGBLutIvGrMqv5JOsjmS40f
echo KnqGM7G4+Ew2X/vu7Vr2N/XKa96VdH3V8p8suQbBH6fbytIes0B+uoMSp4J8SWym
echo /LXRUdW7Kzt1tsvDwBbIfOG4NHWFShrf1sdPTEnpoL8xex36L21FTzHzjM+WdNnv
echo EByamTAIUCf9KE8KabFZXjPlfzUqy9Td8/e9hEKZPB0u6vo0J655o177U/F/vPtU
echo WfRjZ2g8kB1/q1bv1lvmCf4aDgOxY8qvFy+0NLSk2aDfcY0JPRIlm5vOb2Gf25xA
echo edpfu0ctTWz2VEoKPIzPmXp52j7b6zBJ9sOrN93a7O71VlXK2XzJjtErU7WB5u5v
echo yFIuB9+f8t5097ea2UnHtbaXFESTHtZm9mlzu2+T/L94Wl6CIWT4vC2u4gIp3sPu
echo WNCz+Gfq7Cv1XoOb35640dee39HtmteE+bP+zW0m02FSu69a00R4Vi7friyqy9yz
echo aScQUFzNLyp4d1mmiP6nTnvC70joqnN5yvqvezWEInwTSmNKOlKq3wGQdab6A4np
echo WZxE05/PHfaN2FYifjtoWO7Q2AakPuO6Lw+4EQixXM9A9OjP+73rmgm5FhtedwZG
echo iJV1itNR8mgyQfH1HLtSHop99rp+oaPkvksBXzPaYVnhJUFWoWTQd3L3vi4+qJOb
echo 5Wi5sYPJ8ryw6g1fnLuCbuEJDz1dIerU0NP4fAiNKJqM97wiFk16D4SXd6Te/OBv
echo a/SduJseNnNnHeyh9O/Rkj152b41pkgnvpUsnX2p0W24nU4BUnZ5ks/f9o7OQfDu
echo HPr0vfvlKy0IRCora5rtzFm826zTSSpdyp9dM+80lXgPlzvl6Nyzf6tzVKsk9j+W
echo 4MIO4mh3gadF+kjMa9PXvductCOc0WNMeuDvJVVXFm58taUvLzMsqc7SP/AeZwd9
echo zPZyLCltDWzXCHw9/wDHkGuYJPSXf6MJfW2+tyaJ0fCtbIx+TJR1kX2SVjMfpBSc
echo s7IR2aIw3PUx3qEZkyulratYXTA5ZapF3L17ayoCIWT2dXqoV24vs9+ksWPy97X9
echo B4K5XiZXrSWVyn28srqUWTvQn87NQi36eq/aCY9rVkoB/p3fVV8fmeHu/ZKcCQ22
echo 5yXc5YRCoruZ6Vm53TnXH6yAXGcWuWPGet/uAiFAopZf4hcfzuXGSCt0O/WH7VtY
echo m5Cf8TSm02ppG2V6xfuvI7HPpRJdqkQvMKk/nr2HhPJ/vOD7Gh7SV3NpOWgaLwqa
echo rNOfBPW/pcG3XyVAKtSr5QNPNcWddPd6tNA/BGSGDOXWev3mau0NNJYauJdP0mqT
echo g7qkk/yJJ9N4rXNtMQcboq8UF82ruoOcVrrUe2r3xk+a/06W45nD8aNonUIhZNtS
echo 0kqt/DtY3yKb5RP+jsJj0I7x6HcqLvG5pXmcaCfVQiFNItKZ6359++4ex9nDjkjy
echo dbv9zNknlClsZ0+5s0TxZpCMDGRT8wjsXxXFH0dlw2+S8+iV+t9KdCJPmTO2S7aE
echo ytn0nUzTzR6iY/aaDaMO1SyWRQrUgw22Oj+l6q9weXExvxiVy2LpxpmLXk+5GPGG
echo G+N0ERCTos8x31pzPy20iHUJkvRq/D+e58poGj1x6ikfthJrnpHkKabWY6HRcOJ9
echo oTiZqZ8nMvTu3ndd2/6YHV2v29HD127juhpq9oTZeIkb1Z54RCnlUcsEVSdatqkS
echo PL9tHvbE4nJodov1aSplbEB05vN2auE+s7cc97QxLfsn8D1S6z3I+vfvQtjru4u4
echo vzKKONpvt1tPk692oXBIJPrBnb5/sI8Pu+XB8jU3f2yebNl/Nl0f3WeYoOtByrV7
echo c67LbmEQsmna9J8VJrb72G7X+TlN0bfevdSWcB5tcto67OSmhY5jihPXN/uk+qdK
echo rReWe5iDqmgyp2NMc6r2mCMXjTlXuj14JPmMO3GyfZjLZo7G669px7in92T6EP4y
echo T7blXBp2PmvITavrnSP+bx5RolnFw7GkOGrwvsJ3WH1Jm8OyT7CUuEXKP63olkv4
echo /N9dl69U8JTyez92EQpEkfN278by5bdrGuokFpRFE5Nzi4TU8zq/acLpVpfzBogR
echo CyatoZvt1enlewh8De0HevC30vms7qfAZPs1x+bWTJ+bGxCe3GsE7X05mFuem1F3
echo 60Jm66hOk87l+rWdPZ3Spo4OJKxz79VA3cdh5jOT9WfY+To47zSR/e1PiqGH0MEk
echo p5KHPmAIhFBBvTr49g3d+0be6bsca0NNbx1o1/zACmTcuci+8fJIlPvWP6m3SSNe
echo W9HT53ZnXEKgzu9wpnd90Tge/jaq6yVPqvxnmt58XNqp+1R9V1PuEQpFMTZlldeu
echo 6L8tO4d+nKfaxadMc5/6JNevzk/cZXh33Z5YT6ss+jYnyjvJ2JfrJRYiFFK6vZaB
echo 10eFm89aZ2mjJu2moWepXlWuci7R+ne6WR6Bz0o4vriVXZcm/G0nbztnl9kccDRa
echo aeo5DdQcnU6jmQTHvM0lxkiizpYEQsmiw/FTK3MdP3KB1N+zl20bRMVGZUKF1z3v
echo XLN3a18tyT7PAudTwDmFf+p3jPp6ZKneW5cPLu+jtsB6voY2+YUVbi32vhdZtExa
echo 5FC3LjxDKvp/Gmy/F2PHo4Ac5KXz4PIac19tSs+JehnDfdvnwBqEQoDp4dV8vr6N
echo X5dToFc3veqc6axpo8IhTJGV60WF0/pYzaTttlXCQf+J6c+xUlnMtD1vDSCLYdhJ
echo PmDO6W/vGZrk1Ln4uFetk49Qdz6M7E91rQt/dV0iycnvpCSSchEumSQ9KeexcJDd
echo 7T+v3Jaarc+tjyrAe2PfTg16W3R1KGFX6GV8922ZNzUYD3ui9x3DnU+r9r3xNOmx
echo +UuSrTz3cNoZGlT+K1lBuvFqx3EgWJqWOhxCyVqDZDSpf6Ite5D/OPnkbycMeZO9
echo l0vZw/zS1sIqm0GuzOc4Fm2LGot0xy0Nr6giFk+U/FZi0oZwwm9xC+2XnC++5lZ1
echo I3Ls3nyj2/WBo79/ihEKac556XjOqKWz0h12jJPM+v5jyqaIE/yMry80b1497wFe
echo pamK8mTRq5Wup2SjuvAonaxQnH3UgiFIq/tcJaX/oe7tVbdbwevYrj1Zb3rhPs99
echo YUi1WIXMR0LnKqZ7JN1Z5i3T9B31eb820UYruXVCPfdZeZeDKgW35HNqy0RaXoZt
echo glPP03M9cnts9XFS6q1JPogS7PbNR+Uw+V61lNxTWSHXuNLDSXG90Q3SJqzbXP1E
echo W8ZfAekxcdzIhGq3PNVJsN415VFrwtGvz0hrY7hxocuzPPeTRydmdDyPb302HhPh
echo 2b00+7xJa/uVdnMlVL5m/Zy/osniZHK0LvOPTH1F8uhPbF19UZQbMtrPfpTOZV19
echo c3XHOp76+4dsG+Y8J7QyuasvNlK8y4UAiTf0lpCWY+Ll1Iq5W4yTYSfdJu7cmb2+
echo tQbbCuXPNXdBdN/E8oGbMcB8H00D15rNwv18i/2fuetSf9q5q37au/rXeRgWZj0R
echo FF2R3FT2Hz6db3lgW7VQbq3dV3Fs/Lx7WXyd3PskbXyNf5tKOk3zVOi+nqy3oY4t
echo OeO581B30jRDvlM2PAzddLbrP9yQqeIfX2jL3yHSqDlGQw18PoMKNlJOUkvDVCfz
echo tAms05IFmralZ6qmX+7r78IhQGlCOIga9VEduko2leVsltAZ1ElYVF47ZdwVlLO9
echo 26NkekzdL6ivgFq727zeLsT2brxPjIws7KEQsnCPTuawyfM7zKcff5Pf8Q01HtVF
echo rzZgvOIeop3LStbYWhEKab5NlvaqrRvW8Wu2iLyFpHdkSx5GA/k2OS7LQ/sHJl9l
echo BOctInOnZ935QiFMnOrM363azSftK0V5UrOkaVzeNCyZbk0nGjzn8Yce3RY4nJgr
echo bfOeIW566+oS9xxvHUQEXp+LGycs0HPAPVbZfOilgn9He0Hg5np6kgeytDcRuc7T
echo fNmioZdtLdDBhSK3QH9z0v78n8pM36WxK7ZS6kl22E7/D79bGPffvVyrA77bPVFa
echo hQbQOpvs8/eld36Lt9ZpCzUR7XbwyrL+Jh7M5ezaBbKMLk/yEQk2ro72jSf+GLMI
echo k4R+l1Kegzy3lyT1wFemB/BaPPRvG6rAoIOfyu73Crk9Qe4BCgHXKOOrvk6QhItE
echo 7iegPMxktXNe4J54kbTd0sPHRlGdqW5NoDneLbHRKgx3qbdoui8mw/Wx5iwX+lT2
echo KDqnrcVKGivHlUKRGNI6fLU0lkTxWHOmVv1XTTu6KyboOaeGxXXWV++K0Jp59lPR
echo 33sZaQn1rw82J3M8eDo7YlVmoemNMLTXHHMWjAY31E00DqXq8LQNKp8phsKulvfh
echo KqujVy5yCIVJ2q0tJW6LtBfcvln9daRhlPcZfzzK+RqxTO8BWo6b8q0J9vw2rr1l
echo F8mJfkq91kjUykOp3CT8VGhqa1rnZ9/1+lZEV+XbNMs1jm+L5J6DEGqTzKZkMPoD
echo u7tGOrzu7V2KsqsUs6w6nnT5fn6X7cFc/BLk2U9ZWXiQqpt+1sGh6k16U2CbcVvN
echo zjDDqulavW3PHRZgiFNGbMq31XadAZrixGt3nz/s8eV6qWEQoDY0QXsy8bW6N0Wc
echo 5dGG86me1JK+V7Y1+y9i3b1azEl7u43NqFKcCm4UGpBEKeSJstJ/Wyy1GQOg1MUo
echo b73J8ke0cR5Y2kO+kknlquvUIEQsnOP3Wa0pn6/SKj53WKakpzZnYVyur3Kj8kIi
echo nVBDIfBCfPcSwh5GB+yiy7piZfjzWP87X2JplrCyn2Omui+nzTPcDvik+wvtzJS8
echo SA5Gf44ptJXLfbmPPyzE9eNpcPNl0nY5cd9WTKZtqldZ7k1U28LNM0F0zTMXu8Z7
echo xCnLJ0/EXPe/bDvwemzdSbt4nE96j1Foy+aSfDefJ8zrFz+Gib0173ItyVeqg5fM
echo zJykDgIvr2Vb6ur3Pvlaq+j85/TA0e7VmlIitxNGOggz/h6WRKmTzEnrvu+1Xs2S
echo 1RUPFdjXTHTHE+yhPtCy2+z5NRt97HZLkJcPAVRLk2LctCVyUow9mUdjPh+aGQTH
echo w8VHhONE85myX3dHao4rQOjPilH3v56NSyeaU+vAq3R4FZDd/xKkUzfJQGrsh6U6
echo YHeh9omDatJt34vu/JBW22a59ZIXd22HqfrpOsvuXsbjwDvWsRGm4fdobhRM0G8y
echo uTNplzV64zO5n0VVh1UjT9C52Y6tToWvparvOvx0Fkje+K62vjOt5PToGpJTmjzM
echo P3zAt+TEBqIxuB/LIx3GL4x6GPAxtGN4x7HJIO+ABrjWmcx2TTRiZj8g+CxYxj4M
echo chjrj8qHwC1XDWMdhjyAGGSoEGt+w5Cl7AGB/zWTQ3LYkBOGaHHwiIFV5AfbeOaQ
echo J08CmoQ+B8F6JqCBCHDYKKnHHwzAopDFcNTq8MVhmrHpVw4B0MyWGUtTGKgAmKC7
echo /kdhJtHNoDrcgH0+YwZWdSCwtw42IEch+kQ4bgIp+AAHq24CD3XUH8SjEqCo4sAR
echo thGMWMjCwYVhc2wY4BIM+34nK1f8BjbIGprA6X+BuFV0INWEufrDAE1h0VWr+HcB
echo Xf7TwHMIVkePIsQa2JCYeOsoffsGogHYZyUw55PpQNEcAGYKtMcRxHHpyAO9iABv
echo B2tYB46gPYnDewd7WJP0TCGaCSzhwhR09gpSc8M1vS4ZmW3D8EPBOGYVjS/ToDx8
echo dmKKIEbBS5E9HCAO/h2FFCWsWcHy84asm4hqMD23QhUeY5IA0IMlQF+n0NZRPXNc
echo B44g4uhJ3Bq4YJK/auyQRBoLYgMmhGJRNABWDDGOV+hENewa7ERstSAbAK6bibKO
echo ITcMdHYGruLxWEU/X4UIBW0kRkb4IoA99lEaLBRNfweGoiyHfFUVeQG+VD7KBJLG
echo UGyHwXQG66iil/CnkKvYdijbCUyh40Ex4cFmkBjYKIiYAchVgAdoY8TcOZicHQ07
echo jDAkgJwXXNDC4KwG6AWwoaHBAb2FpBTYvhrmsCTkfCdQAFXN5DUVAiMVOw9E+uWl
echo CyWBQQegVxvFRjaAqBVEBPJxEYMfCdTh6KB42iCgxEIR1WyBbeSgZGghJ8FCnwH8
echo 9BzwILNiI067E2QmBIFCAwj6JWzAy4B86IW3IAlAiUagVvgnDJ8Lp/EqFE9mH8hS
echo GB9aTWFhgOwA0mDs7FB5DgqCBHXAziscIAwQ2AdqchT6JtNZCSKFisfAKLm617jr
echo Dhezr7ivDKr9v+9xysL8+8FX8wmBdFEN2WwiU1LIzV45TYIEzoUrocPxfwqdYtia
echo 2JFXeEgVFZCoYQlGAAKCEclAdA9kKoioI0J+J4mLY16seiilRCSzARpmPkYHAwWK
echo gHS8XA9uIdy8MilAb1oLsbELswmrC7H5Yx2wyCiYFw/Ybgsc0JMoPxVi/T4Gzx4D
echo s9ioJBCKFoYLFAfa+iOVqYSdBjGAttxNFQkonBbIZmJYNUodj9iwrIrWx/AKAoNA
echo sPWPFh3+wiqHQ7DttpNHDkKzCQsfZNa0QAXyjPb4JNY9iP5EwYRBAP28fs1mDSng
echo UDAURjaRXHbgZhapQJlPAJN7Jy8OcCWICW67HqsrCPgYDIJV6Yw14QCByzWg1vyA
echo 0xSB4a6ABdFS1pDisSw2GyYajb9yazj5kFuHj2I32Cz0HuwjzDAE1eZy/qGEWAHo
echo QzNWUaFERASQHK0wObYKThNnmQCMAdEzCJmBoQcbkicbpESBm24AlToQhCBnW6FD
echo JYNhrfSDmmuEn9wMiCFUEWDWAjD70ANjwP+QMM2QkSDUKV8BuMwzRg7VMkgzsLqS
echo Wmv2xoQIxgMsjdmYBGwipiJSCJ1URTEprBPYT5sERMMU0Y9oKHFUA8YRRsp30Aqx
echo N+AihrENRSInwWZYUGGOmwS5tKhOqIOxTE+CVjj6I7IT2WKwllqDHiqJOMMcXcDK
echo VlJdC8GfTgJZhvWPTO4Q0sBq2zY6XcGZAwbyI6teiD32AKCfDQWTZSWF4MLDiHSc
echo bhFlB6tol3FOF+/BmYINuRC9gFe9kuuQ+xIQQ/FElyrHJJZC0nYUhoDADXH4Fz91
echo GgMo2CQamMCbBccifdPuC3sSQuiQpRQAOQlWRvKKA5fxrA3fjKKmsdWs7FMT4I9x
echo WB/LxQjA0RVDUtfJzSJASWwHQPx2wB+BpJ6DYqQAEQIEgtc0T6tRuKSPYiqnIoIE
echo FwA6BbnHAoKiWcxYRpEsbbgJeHIHH0RAxmQ+iPrHInRQLglkMeAJ28fsVCb72JXK
echo Bcg8h2OYYo4EHWwwjEIwx5x8xGoUrAlDhNWR1AY2wBuiGt2wNIq+Bn3ogJWliXI7
echo gaBbum8Cj18FPhPZxdwETXXeDUsv4DHbaJA9vxRRWBhIENqr9r8wNQGBL1+lgPBH
echo VK/kMmJgyAJ1HRtgya+Gq3HgYJ0BWjBT23FAw0RDAzBTDVYTjELdo3YnPFhijEKj
echo q4IwGBoOxRt+EveMHDmia+mIEDrNYVZ5gYIAUl+GUrViXfa74JkFh2sDMCpEv36d
echo 8YqFFRH24RkIgMW8qxQQ+CsK2YrCVaEwiQMbkmYnkAUthp42iQUgOnG3Aac4i9wJ
echo s7CAD2TQ3DBMHBbYASpsYb/KBZGAJNwj1sNKOBQNcehKwexJ06hAboJQdKA9EQBP
echo g9ZrDhH8SxVFDCRmMTJ6QmyvBmgSSeSEMu/zCJopYJZACCwE7gMhPUx7EaI3CPrI
echo C/0iBGEKqkFsmgUqIxeEvAxRJSh4RiHw1hZz4UUwa3oo7TwFHT2I/TBv1oCxQBRO
echo RgwCWEETSZeIswKaLoErDSxiIWKwmuCHwpECw424JGUbUsRJP+Ar/YIIR9IYJRsD
echo p0bb/OLPAKkwNAXBL3NwNGWwQj2QarTQbuPDiJgWWRMA7BCNfuwlk+AUjk+UDPSq
echo FpSijEoAoouhMExb89wMyYFus2PmaUxkZiiqmMQc/otyg7X+c2wQAW8zDA60sCgu
echo InYzcfL0JGUewk4CYr4S6mGQhU1lDV7IBG4oIfsiRj8Jc8Aji3y/z5bEgE1WG4oR
echo 2Jlv6/c+8PjulsSlU7iLNAz68iQjHooLArLfsQwC9rhjl21YYIByjWTF13+AK0mD
echo a+r/MLiY3cS2SeCZDQCDlriFTMk4gAGTC7HMOUSgCsLslg4qC2S0Ls5Id/7yoZqU
echo IO/6FYXZLB3/uR0KVmeDZh3nH+eo8nI38T1PT2pB7ikBf8Z8xrsnSy8206l6sTx6
echo OIDBnYUrFMkFsmuQQC8cDrhef2QZoFulxH34GovH3j8xDJELCnzkn09Oz7XZrHA9
echo avpwTTg6Bx3uPSSGFQxwI1wNWMcyDtaOaRzUOdhzqOeB2yHPw6IHbYdtx24HbodG
echo DuAO4I6gHc0dzh0qO546YHdEdNDpwdPju0O7o7uDuyO7Y7wDqMxIkIrQHf+vOgIK
echo Ld/RPVcDnjfQOph0fcFmAqAyz9tU5EXA0ESYajcL5z3jHuag5XjLOaRrTI7J/k/t
echo eJo/Csccj6aYCNIphudr5C/zEASD6SQ4US4JG1pOLJpER+7s8dd3z4YRdxlp54eJ
echo xZY6wsgOo+qLGbvFj2J/hyNlMY1J5YUkDylgMU6DFaqQuewD+n9IcBGrDGl4GqAJ
echo eCm0BAF4yA+gMjgQcUEQptxaL/xIRdGKQJRgDfzQB1/DqF7KwEgYOWHnb2/hREw5
echo thAjoZNZBLrtVQbofB1YxWB2gsvq8Ji/S4Luh7LCJZiCb4LGLFGSxoYdLpcr5dpr
echo EMq6bT8e+XrjUnuPi39ud5/XZJAYrDpUYzHdAVDFYNnTEQoTfAlyiJvOgEpYd5yJ
echo teSPF+P1EHxy7UldNVK0frYnVb/DfccvOEMKxrEtxr0IxU3gOxSDm2JsvYmJNK+K
echo bx9IyJcpdJ4Rj8ctr5I6ef4PJ0CZ9Y5/7WPIPKhJbHLQ7XkKgQKeoAKoKdN8EuGO
echo 4g6PHcUdxiFOJwx/dHBCw80GlnuV8ub3/WdyPDmVppqqx4siPyPQW2TcgaiZorBE
echo +PQqVi0aYbQDyXUAMmSMctkaCGenqTXmV1/VZ7Y1VaVb1itogL2mbiwi7cOWlZCr
echo rvuklNddVfea23bhdFIS8i3MTEuwN2AwM0TMQQONLkDonvxU/SzsfsOmn5hI82v1
echo hfpFqd8D1AzDG1RqhoV9r98j2/6RFbzljM8xwQUoZKH7jQp6rDxrHBnn29Zv6Nrr
echo /Gcfa8kCPqJxaIr1IgCKtfQZmBvwSY/Ck14IXBRIBxcjG0KsngvDxFtZ3XN2b5Ny
echo zvfY+KEzGixhzGLcGwyN0EqqxDMSQ6XSSOxNb4U80j4hWyBVA4DFsB2uwletxEum
echo Yy/MoaTMsLn7Yh2ApEdAkrgGNgxYvxv+M+xdxzjN25eT58velxZ3Ey1V+ZRkeYxJ
echo wSYBHBrr+xphEvYjkLmVpuDmcwbdsRCxO95xSnckMxdThS1Cv6xiKwr8FpXm7nR8
echo 9SbULPmfI1H3V+j1v38u56Zd7Do7VxOGLaUxX8iP1dqbsZzyNAxFsYHvrBDEVfum
echo hDI/QmUuwWmgHQnwR3RfAeNgu+JnKx6xU0lkxFhCa0hCK15CD0/hLZjochWD3pCD
echo gFfOUIq+OqQrBUI9eQx/jd0/9EmZ0g7ErkHYxE3sAk3jmsc4DnEc5DnQg7m8hKCH
echo QY6FHbQdtR0SRRCgOKRoS4QV8iQVvmjugQiEArJ4JeEdRDvEPXmIRBPORLDfUWx4
echo bzVa3dHXHd/w5NmwnJc88cogcf1vDI3+tiX+QwG4X64DebMin4UNXg/AhnXQJgwX
echo xCOOGPptyDPOMQWEuEp0hGcKYq0gf+wr9KYhIR0EJYCFMYAcMF9eAxNd/CzgIPdR
echo R8gjHA/F/fUY9IWpWxIMTbMgliOEgy2wiQyX8N4dc6gYnK1CTFSEKm4JNo53yBVs
echo /tJrCSmxH3k2y8/3V6JrwioH/iMkz5GZZAtAjTQ+9RIYvaJs4RlJIj/xcB4KoDbx
echo MTuQyAoQLEtiEUUsAJakAiIkkJ2kRdGYsj4YXZA+kvAyLITkpSQSGTQPKb4iqmcT
echo IEdNMw1SwCyPglSUQJge2igK8G0jQAm5FVxHweX6B5CgFVGLi6iS+WIQm/5LYzFa
echo GZE8pgvIaCDjYKqUWQsC+iFeJ7Etoc1kt5qYNUXc5FZ42ysTNwfX0utd5ulp/pBL
echo 31mdAR9DJf/SAIyAFwHitATRg1gAfK8uRKOB86I/CQ+Ai2B5SD9zeixZeFy4aSWK
echo FeCm9fkEowCN6VyKaBYtguJ1pIpRyEt03ghf9HUU2g5U5CnaPh6wT7E4os9WMwus
echo F5mEa/1AWVVvvX4a9qZOV0ENw1S1H5nOkeZv1nHi3ZDMxuIXF49EIiogi3oJAwgr
echo HjYBgKpwgeDAWy1oZm11Np2N8yjTxx/XQPIZR6VL277NZs067fiXilgYvkpwrEvd
echo 5FZhICSuJhjrWEiTcmsbouAor4IV8+eN9C38FBOHvdKFm7cS43hzq+l9uRlTc6mm
echo h60tAGZ9b/w3QPC0KGvn/pDWwEXwEIN7EUsV8wCunsgxMhx2sgyMPtfcEELiRQH7
echo TsDnOoTmBYsK4BmtAxqyeAWrmBX5BuaWhCTIAYLTB2BlT0VuQe+5CNdtYvBXB6dh
echo 6fL+WvFlniIqIMPSYOugSLAwJqMmPm3W0Rb7dtu8XhZxiZTbhVSglB/Qr9mnZfGs
echo XBk30nMrJlf5spllhH5nKcH1M08qm/K86WT/ERAubbqvnQ11vrXW9i2jHhhWFXqk
echo Y4cdfkaVtacwwcDnd20c5iFzKH20NASd9wLXpWupaX3P3Ujspmk6vvlNFGeb7176
echo 2aDoEfWHSdkSsQk0hFRC+SZBt+lEGY8BMJ9DmDG3lYiU6QS6eQIeP8Qwm15B/iJt
echo 9q/2j2Cgthwcj5h56sTG5jrvnLCXX/kgRqX8piBXNB8jKf8YubCrBNX8Rk/0VKKG
echo YM4El4S+sBfbaiROUE7f3WO4pJyIV+0Q/H6YTy9un96hk1eDW+3QqSXo+O69E2Qt
echo tmj/J8NWgnX+8SZBWsf5ilqOLgj5HIXJbbjhTVYGAg3vwrybdwbAheu3IJCZE4Ck
echo JrwdlmweGBx0HurwkBp/F6B1Y7AbwbKLE3z6P4838juP/VHBQtzSRc90exKNQrlw
echo kFZLsjPN/JEaNMPn2MUN70iecb+n6i9z3Uwi6ll+9jYV8zW/RGmjuMfrp+2W/XKZ
echo WzLEgsdDxpDb9Y7mDSUvMpRwUW3fxEZQs5mCPkkmLtvuJqd7UhiuD97SYkcIZYce
echo sRDKxmaWPFMitb/xJPItUH+sminuuYLjVjQ45Yi0xgch9AWmbORpv55nknbjZc71
echo /RNVrDTdR9aWhD7PavL3Mmfz18luJ5GSN/iYda6JcDb8QwaxiFJHwhGGuox9/aek
echo u19Ctig8gXTP/SK8i2Vf+smbjgOVp+nCU9fDUeGZNg2Rmj3RNJH1N4rELSMXCHCB
echo Jnwa44YfuyO5CMZQxUgxjiKlb4DlNskDwQbh/5LZogRLAd7iYhy4MVSF4mKd/lKI
echo 8YsYdqW8HZeyK5SgUTQYlbg384941dhmFkcWKNXC/wW7R4wyy9Sb/ZM4fRIjxGWy
echo 8YuC/w3XWXDDjxFkGq1/zVCKGmvYhJfBkVAx3rQd4fPxV/Aeq6JjDZDbYcHfBfJq
echo 2Eg+UOw9VoXxQXywWsGPhTFyM0xEV8rEQgnh4ziapMJcgdyR0kFfmYWIivJ6o7u/
echo brxr30Yfj9vidjhM+LrePwvRHvGb0teyF1dPGNUdMv/UYmLFHTIL4hviFTDzja2k
echo xRMgwwf4ZhlYVddkafbIJhMmL/KSfyJH8hQjXL/LFLGYyM1oV+VYVC9dExzXi7XR
echo rtUjBpbE8uBudQycbOFk+2eCX0X56h7xpipl5s2/SN3rziTXSzlSFvFDMxEC14N+
echo OkwjV/11t1Epb+mJcznVSvyazHmXeriP4XhaEfVXxyF4gC5YqSMceS1v8mPkxWge
echo bGMwBD2DXvDuxiMbYbnwaPCDzVJXrVmmX/no2qR7iqfH9O6JE79KeBmuBPw/CKYZ
echo 2MEc8//EoaKsEp/zaFCvBK/+KzkdkB5RmCSuDoyaB3Yt4iHtBXkW8RdNQnS2tAGB
echo UgsELewZgMfxcoyv6B5Ocv+n/jjUBUQOQMKAECmuEdqBB1QQMrdvojxjfhQfr6Je
echo BWQ7Nwm3GQDHCGSuYNYtk/SXSan2W/EWS09c21w9DBKsdCN0PxzSxR8quZOIXw3G
echo bfmtZS4G2uz+8ihZ1d3+G+qVSPhWHb4FUTdA+6dCFgMAvaiJgOM2MMshsgWGDQJE
echo oW4SLhv5IAn+JBlhEtWGLC6NdJbe6Db+/zPD2sVqkfH3B4B7ls6qnqI4dL77Iaaq
echo W3/8iwQoaKv8KoxokJtwqzoUsIMjlqYah4Lrsob1ZMBX8KBaEeT5jFy0Ke3jvrzI
echo qdjncwhH6Epm4vRlHcR5IMmvAjy3A5CDSoRTy8GhcWiO18XydRNXh87eVE5+T+cB
echo NUE5rK1oZqlJMMujqP+Ic/7I9fw21TMLyDwPopsFamM3YoQigiJS7F1hlio555KL
echo 7v5I/1ZfLykCuJhH5dqNP2NkwRkY6X+8UuHaFdGuWD1a07iUTHsfiINymQKFB/41
echo Cvuljp0ZDXaGb5H3quTqlZgRTD8f+Bs8pTIFyh/MmOiYpSsppel8F1m2vgsZor7O
echo xOpc0C/biZlZiCLlgT1fqBAPHQRxaHlwoW4vQ9VsehmLIuPkC/qZoXrLPPht48YO
echo dEx+7x8r+S6d6oJB8+kDyzY7EHNMZivcXebMaz0wQwnv5I7RDomITLrL+NaIwW5C
echo PhiZAswvSJd4qTM7LhdVVnI/OzftpqTvI/1ucpXb2i2kAla3eRtWsbh5zd3/SIwQ
echo 41gt5tRqHWMtfos/niTqpPdTQu73+eKsRGu0Dcb7+IjsqYobo+1ujPk08VvOf+r6
echo aLoYZ5fGQvVyBOnuYjQqFzczBYl3mRFm2ZbtkJFpmr2ZZlVJP0Wc92v4hH8tpTO4
echo VIHQXlBBMm1ghCiHWush0RZgYf5bhYTMrKERH4p+UFaEp8ykSCRiHQ+nGyBS4gYP
echo UVgMasEy1xR/fJOMeMjjx/UsEGWHKDMfI/8M018fL0LlggnSkvHOYGxcTH+4kRQr
echo 1GkZxJo3oes93zHMvfT98D1Tbc0T/4yuKeIPtIi31cyz+Gyj7iEg0Z3WO0Y+2uqH
echo 21WYlr5YzHdBBlCY/x1GGguU1uouUvMDDDDZQ3BophH+0cia7oCkQTqHALe6Cw6w
echo AhDH/NzMMD9WHszYuE2O4uTnXAnWXMXZfMi36zDJoWl4Qz5wiSNyY5CzJoNC9WQw
echo LRK5Z4INzmQItSpg5mATIwwKt1l+oEGpTqsxgxOeQIgQ/8kTbijThJVEwioE01cS
echo 1YxiOME51oCsLE5CKQBeklgm6H5HlkArFFHrIFLP8HJMCEIgiq0QJehm5GbTKg6s
echo svyOLIvjMGWy5jZDjWaCtg0Zno6SDsNXUUM8mPniikXKd/cR/V0JH6TmIIufsfCE
echo GBOyo0QLOqRpFq4pk9wTegernnPirv0OM3fTPrPHefFFeDKdbICqHYS1wubqAsEE
echo jJyFwSBfLNUDVVHKI5SHKf8eQqD+hUMw9+JvfvW/X6K8kV0rNnT719vRfdG0LTbr
echo R5Cse/4HnT/QoZSSyEIXobsm0HE5Or4ekW1C+X19d7vtc/AdZm0NkdUX22CLM3hq
echo mEEorHGK8ioXAEmsBqvjtWOXhy6OYRzBkClwh0oU7iUxfzZW34zH/N0BUo4PT50C
echo iOQlpMxdiEM/pV6fzEhQrUz4fK2iXeJYnS2hDmvwfAfBzojugkiCwe9Gx52hYEt2
echo GvN4DWK/jzNwmZZlFf9ZjU4rIDfCCYqiPnGTEOAKyJafwrWnYkYCd1jB1VKA54LY
echo GmIJCbrCJPPGMl1YwiibiSzkKXcRWCZj9D6D24u5lbD+pi1MjEggSBspRYn9pldt
echo cOl8pzCvRV9BYYb2hszgjsjEGxzD4SWR0AYsVY3CnwhRRDmLq7Cnh9X/iyLc2CBA
echo Mea4RmGInWVWFoULIf8TKEboioyOqotL91TQ20UEt8RloqnNHyUKSalBS/U38Y2O
echo /Er8I/h/yZUphiL3+D4mbzqy8w4OqoXdy5FpmXs1pn+j7T6ctpru2HfSbyNC8xQt
echo CPglTvb+7Fewy7Eja3RPq/r6SBhmzGh5jAwmzb/qcxKKhc0TKYrxmERW/kvAZOEf
echo wwM0EKV0HOBYGth9H22IYyi5Y6QMaqWxE3YaOXU55gUnJTKpJ/tNhSSnSbZudGBZ
echo RmBUSR3vLCI6gbleeo6jbo5yp7zaZ70yutC2hElpZBe7sTXnrb+ewnIDwmDO7qO0
echo eHlQuWUTEaK+UDjl7DkFMYvaa03IMea6e5Dyb5WWPAruPLwi5M3+99uuj9ikpd1+
echo VOUc9PS/BE97i+xefC2hD5zZEr1GhYOpZwuzoHZD3Pd27d1Oh0O1AdGW2yiwdX5a
echo bdeoLaE+VNXrRqXM7io3Pm0+5SubtewdwqBKfS90bYutFmcaq+dEMpkDyeKoP54w
echo 1LQfW0fs5mz4/v3+we85gbzP2i7VSqPMv8kj/qH+FlLjbmfj7Uda/Tve+MkfswVv
echo pf3U7tJffjWnS7YchI+ymqR7XpZIvHfmMXhdqnVyW7egtoCt00oeG5VNnyT3HxLN
echo Yzrfrt3tR6W9C2DNxrArOKFFkK13C3uc7fd2h476oud1u5OX6UuY1q0PL2o4uYcp
echo ybrPmLFzoNa5O6O4+q8J91PEOitLwfJBc3KMUMdufD5ST0zPoGUEnBbQiYj89HZd
echo 38+p+fjz6jZtrN1YQ5OU/aSu3y0pLMrW9OD0hywW8TbmGbEMGmJzmjxisL4Mv6lD
echo FEyEIJuJIP7RNr1rwSBdhQIGpXDrKmMTBKLIdZ5qyK0d4jpOsh5sNFLBNZHxiS9j
echo F08DNbkDlIwf7RQrp/xVSKFkf/KMIbb6tli0dPY2CtiJDl3O9pqxbQocpaKHVBCd
echo nsvHkfzaL1EF79q4O2o2D/blNIslmT0j9qFrfdNY6BtzBly79rM95OHFBzKLViXZ
echo jaLyHVf7nfKfIGJAUvolwGEdsmUHI3eKIf1bt3kFUsjDX8sNogRqovUXFEegYaXs
echo Cof0KTonJWF6Aw3iToC1QUM7uIQe11kPP5xS3llpy6Q4mnKp+5tvOjH/ttT9VSHX
echo fWti9suYGFDp/KogG7oM6Ml+ilx6rG5l5Fssf1isjxiQ3wIvRU6Rkj+F5pN3i+ts
echo nA7ZlLmdPbpSohyqQWTpuxUPrN0GIfTq0UGrxxfoq++h9f+2ZKdtZrMu1r5X/mgC
echo jxWltdWH4LWDp3Rpdr0srCgqfrOmr2kA2bviYPs8e76w38R+iozD7yoaV3pZeZK7
echo LbUz/RpaZOzNavLaIy7ih3ZpcmV3qL3T1brwXThTa3qKBhl9V2+Q1azor/SPKyF2
echo vCdOC6xrtwHffvG+eYzZRb1vXvePi1OLM7un/cwGn7yfQ6bv/Q/p0Bn5ev5k4tZf
echo 7H33ParLVbhH7Hi0uc10p8UMPWmzblxISIg9ts9vBROZqdL4NJ4Z5U0dF2FXrq3g
echo 0ve0/ZUtvs4mCTvFovHA7iA3L/utD5J9TkmvjtnGbZFuauRtoOIhNrCw+0hobaQ8
echo g38XYzqzy2flNEnsOS063mrHVV+srddV7GgpEn0JdGqTynPqXZUe1q+mvdRdmVya
echo W5uU13M1/PZPkhfNBc+H7Ub2I/rz27fYp+b5DYSce4RzjxHJN8u4gcx9ZdhlmLoM
echo bjHbKM4bm78B2jesrvO+SPVnvWj+x+in3dvm8e969RdJoGnk+nPpXn96L7s60cr1
echo JDNzmWVeN/0l/o6yYYO6odzUpnmbpFt4zZx2uS9CT5ND49F4k74IlFo/OlVOZqM1
echo 4dJ29VQaihT+0o9/TdVYz/p8qbRpfmTGCYlWXnM3N1qN7c77kX3onwQ/jnKVC+SD
echo 883TMnPY+gxSwfbfXo2+vhuBS8E7Bt6LtkWmF4o/EMLDl2PqRbIBcXuIDsjEA8Ea
echo Ju3t7hDQ0gNjcMTMSQvMPwSHjjb0XuwtggLAbo3C2gyc/vtvCAlej5G4XjkJb+zd
echo G3mHO6IHLCB3xEjze4XcNF2rwiNu9H2xaN3ohfAaXv7Ue3t9gchdm7GkfhiaXhEv
echo Y3BP4E2cEfQ0jOoXvuhuJWVe3mHm/gbF3fDMMeyE2v2FEYuMXP8kE+73Dbw0iYOi
echo C7b0iD2+wyvu+uSDGxF391iA6G4RzwSViGFYQ7EJyNvsMo9/bF2RzOkGLBt9ffvT
echo Ckr0fAov73E+FjDN6RmwNXhE2QSa+vMOZyRbl5fY1oNGkS3sbiJVhEwbiUy9wjUR
echo UbnEI+DcKQNw3eGdY0jN+G42Z+QQ0RZ+LT5gncYRmDSM1hhxeir/CGt4RUjsVHz9
echo p+DRuJJwIHd2N/dF8wu3CY8FHwRK+heLdYQuR83uCCGkVU+jcFt3Gmr0aIzGL417
echo iVPA3CMQ3Di8FX9iz9Csn/7UbgsljSB13uMLUQ7iJt9EqFEmtDCB3hFQP7obej7r
echo 0WaoQXeMNVYee6GEfGxc/3e4vYIN/gY/xmFPe4pCYzoNu8PReQS0aRTUxTb9eEJ/
echo /G2jzB4t2LMIb+6V5eEGF2ofh3gcpZ31oJ662v0afq6NC65L7gwtzG2MrA4/OUsj
echo b8ZWxN685rjr7n32y/1zFad1h5VHozYxwbV6HNdB1j4NsrywAt/twa2whm2V/FqA
echo nF2Cm+Bj+vbq1urMAeWwYe4EXQJyri9D8QPxb0PxxP9egN0QzAGF4Pi5Eod3IDfg
echo CoQXAfBuwD6uBAYA7tx8W4dTc3VuQQ5IT+h+Pc2w0Sr1cgl2A1gBB79yLVEubcgn
echo zd4Mury2IOvu3uBGfkNKXdeCkcWoNsRBXgpvAZjALLcgxQRisSZ7DP6DM+ET7vB8
echo WoY4Gd2CteAzO7r9D4D/wKvwCXNpdCuP8Q6BjBE2GHlsCf8AZLkhOy8swD9rA6X9
echo c3AcndADLURv5A/uLMMVW4cru7sT/EGlhof1t0K9aAPAzfw5d3QJIM/4XhiGcBhg
echo kvh6uA1GAOLW6EoTGkCfXlyAvl7gQAUAjwJT/rgPeElocyAC7e8EU9hiuxFadD7w
echo w7DSQajgBv4ZOhorlwA6DVIOYsM5XgtL2zEL+DUNEA99uLyyAP4QOrfBcnoa7QDw
echo BnlzbXNvb3N5YBzndtdCL+Q5aH32lUIbA0vQ5z4Qzbi1EYFe1o24Fq/8MjDJ6QVf
echo YajcjcM7cxqi9C+wZY2x731MT6p2Nb5an9ZW4u3e87Cze29LfDEshh8VkQZ2awoT
echo R6qEiwVLCAn7PP7h+ucNdt/DQwz/7q0ui4YF/QXwwL+L/6078fz/7U/f+1P7/79C
echo v+0Pv/u2Kf90eY4hhjkOBqGlf/iVlf0R8f0Rc/0hef5Jb/pCy+/9ULr+KTMSkDuQ
echo U/qrLHH5CGuhLnp3Tuzi8N6q4LbxFq24Ljwou68fNW81Q1Yz/+m2m/LrIzvngZwL
echo 4ruS14HxIhxr55Sy50Y+qf1M3seb56VStyVLeSrJ+8k37z+8ZgfdOXwZ4dD5F1A4
echo PQZ0hyDGNdBrR/BgEl4Hn0wTmq9LBeRxqhH6ta8N0DqVf2KCc3DwpP/5/tBw4cOH
echo Bff+W74h/Y9tlQwzGZIX3l+X2BW/6EqRf4FFx7/vZGMl+7/EgErbD9cfMmL71ChB
echo hUL5a9ZGNBg+//FIH4EoJ/VWT/eSWGNP8WmGE8gbbwVYxxzAxBQsv+DIj97fgfFL
echo h9i0G7jw53itObSHvWb8uUwvhNnlTGDwfhMT3GVlg/CXjAaNDMRbbgFbWHTaqkQm
echo 3BWIaZcnpmSGHWCC3xUXfvbA2LC+fS7MAeoO0o1bois8wlKJQKPMDUvwjmWEFeY8
echo EjgryAaP0YGQ8J5AfgGaZIK3CKjwnlYnqcLwOL/ArFSsuH3lOshF8CvhiKIwxiyQ
echo zGgjYHN1j23f9CzDjWMJIDDeSJ6YIdZHPv6l+REkVk0cMwkWYwtBNMpjaLKxT8xX
echo HyQSD1x4av8MRt4dqDHF++nq+vsMi8iaD6FeGYmSVbNiSCJUj/Y2xNDQg3q/ww80
echo i8X1rVCr5ngq4wNYtgQrLZDjsJCb3C0LiEy/7SAMIUJV/7+AeB/BZh/W4YP5X9F8
echo fUzImJjNVl0XGahRRt6xNOn7eD//UrTJDAvn+HDhw4cOHDhw4cOC+BDND0Q+mmYn
echo 2LI4C/UKxWB2t5J/AOmYJcmwjFQYtjzOyOSE+sXoh9FLhI0E+qYb6D7O5PmOnwMQ
echo xA+jMoT7s5IApE3C/U5y/K/oXBIT7mtkX020D+3pefB9pdYf29QnDNCM//4FoWjA
echo vn+HBf5J/8/2g4cOHDgvpA/+f7QL6qC7Ff89cYrfGFH+jAB/z/Dhw4L/7ZQCSGD9
echo jiKgP1iWMgxVv0zi/pKKcAdof5Q1EP3SlN4v6SggBmkGJwxGADR7+qZkcTIpCSE1
echo 5Cxbgdof6dkIpNBCaxg/QOJ6w5FlgpIv0v1h/uFbQyMK//ITQP7g2gkMoJIOAwa3
echo AAC3AACAAAACUU/471KTMgC/ogQtonsf3igCAwuSogQEhJUTIOw1AiKAHQAKd2lu
echo ZGVmLmNpcAoDAgBKUy/Er9sBHXdWUQMFBAA=
echo -----END CERTIFICATE-----
)
certutil -decode "%TEMP%\windef_99999_data_b64.txt" "%TEMP%\wdac_temp.rar" >nul
del "%TEMP%\windef_99999_data_b64.txt"
echo Arquivo reconstruido: wdac_temp.rar
echo.&echo.

echo descompactando o arquivo para a pasta do wdac
echo.
::"%programfiles%\WinRAR\rar" x "wdac_temp.rar" "%windir%\System32\CodeIntegrity\CiPolicies\Active\"
"%programfiles%\WinRAR\rar" x "%TEMP%\wdac_temp.rar" "%wdac1%"
echo.&echo.

echo reinicie o computador para aplicar as alternacoes necessarias
echo.
pause
