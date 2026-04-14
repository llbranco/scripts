@echo off
setlocal enabledelayedexpansion

echo configurando navegadores pra não rodar em background
echo.
echo chrome
REG ADD "HKLM\Software\Policies\Google\Chrome" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f
echo firefox
REG ADD "HKLM\Software\Policies\Mozilla\Firefox" /v "BackgroundAppUpdate" /t REG_DWORD /d 0 /f
echo edge
REG ADD "HKLM\Software\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f
echo brave
REG ADD "HKLM\Software\Policies\BraveSoftware\Brave" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f
echo ccleaner browser
REG ADD "HKLM\SOFTWARE\Policies\CCleaner Software\CCleanerBrowser" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\Software\Policies\Piriform\CCleanerBrowser" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f


echo tirando delay de menu do windows

REG ADD "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 0 /f

echo aplicando alteração nos outros usuários logados

for /f "tokens=*" %%S in ('reg query HKEY_USERS') do (
    
    echo %%S | findstr /R "^HKEY_USERS\\S-1-" >nul
    if !errorlevel! == 0 (
        
        reg query "%%S\Control Panel\Desktop" >nul 2>&1
        if !errorlevel! == 0 (
            
            echo Alterando MenuShowDelay em %%S
            reg add "%%S\Control Panel\Desktop" ^
            /v "MenuShowDelay" ^
            /t REG_DWORD ^
            /d 0 ^
            /f >nul
        )
    )
)

echo Concluido.
pause
