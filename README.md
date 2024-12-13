para instalar winget
```https://github.com/kkaminsk/Install-Winget/tree/main```

## coletânea de scripts

todos os scripts aqui contidos são relativamente estáveis e seguros (se usados com cautela).
O mal uso deles pode acarretar perda de dados entre outros problemas ainda não conhecidos pelo autor.

### Leia com atenção
Ao usar estes scripts você está ciente de que o autor não se responsabilza pelo mal uso dos mesmos
e que você será totalmente responsável caso use para hackear, piratear, burlar ou violar direitos autorais.
algumas partes de alguns scripts podem ser reconhecidas como malware/virus por ter seu comportamento parecido,
mas todo o código foi escrito para ser limpo e livre de ameaças.

você é livre para distribuir, editar, compartilhar desde que mantenha os créditos ao criador e inclur o link do meu github
remover os creditos é violação de direitos e visto que a ferramenta é de livre distribuição seria de muita grosseiria.
todo script aqui é fornecido sem garantia do seu funcionamento, pra mim funciona e é isso q importa.

a maioria dos scripts aqui são de minha autoria, partes dos códigos podem ter sido inspirados de outros scripts de outros autores, nesses casos manterei creditos aos mesmos dentro do script.
nesse repositorio pode ter scripts de outros autores, nesse caso os creditos estão dentro dos scripts.


### Trash Cleaner
Removedor de arquivos temporários
e algumas ferramentas como backup de ip

### Anti-update do Mal
Previne a execução da atualização automática de alguns aplicativos

### SuperStress
Ferramenta para stress de hardware

### VirusKiller
Elimina algumas ameaças de pendrives já infectados
(necessário que o PC esteja livre de virus antes de desinfectar o pendrive)

em breve mais scripts e uma melhor descrição


para permitir que script ps1 seja executado, use:
```Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force```
("-scrope process" limita apenas a janela de prompt atual, sem esse scope process ps1 fica desbloqueado)
ou
```Set-ExecutionPolicy Unrestricted -Scope CurrentUser```
(apenas para o usuário atual)

para desbloquear scripts recursivamente
PS> ls -Recurse *.ps*1 | Unblock-File

### Upgrade Win11 sem requisitos de hardware

reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\HwReqChk" /f /v HwReqChkVars /t REG_MULTI_SZ /s , /d "SQ_SecureBootCapable=TRUE,SQ_SecureBootEnabled=TRUE,SQ_TpmVersion=2,SQ_RamMB=8192,"
reg.exe add "HKLM\SYSTEM\Setup\MoSetup" /f /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1

### Habilitar Samba windows 11

Set-SmbClientConfiguration -RequireSecuritySignature $false
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" RequireSecureNegotiate -Value 0 -Force

### Links úteis
[image2cpp](https://javl.github.io/image2cpp/)
