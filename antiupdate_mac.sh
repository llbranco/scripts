#!/usr/bin/env bash
## by LLBRANCO github.com/llbranco
echo antiupdate_mac.sh v1.0.1 21/nov/25

# bloqueando notificações do MacOS baseado no script:
# https://gist.github.com/grahampugh/a027206e47a1e4e9f346b884dd8cfdeb

echo Desativando notificações de updates do MacOS
sudo softwareupdate --ignore macOSInstallerNotification_GM
sudo softwareupdate --no-scan

if [[ -d /Library/Bundles/OSXNotification.bundle ]]; then
    echo "OSXNotification.bundle found. Deleting..."
    rm -rf /Library/Bundles/OSXNotification.bundle ||:
else
    echo "OSXNotification.bundle not found."
fi


# parcialmente baseado em https://www.cyberciti.biz/faq/apple-mac-os-x-update-softwareupdate-bash-shell-command/ mas eu inverti todos os true por false
echo executando bloqueios de update
osascript -e "tell application \"System Preferences\" to quit"

sudo softwareupdate --schedule off
# -bool ou -boolean NO/YES ou false/true ? talvez seja necessario incluir .plist
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -boolean false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -boolean false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -boolean false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -boolean false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -boolean false

# teste usando parametros do com.apple.commerce.plist pode não funcionar
sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdateRestartRequired -boolean false
sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -boolean false


# até o mojave é possivel usar
softwareupdate --ignore

# resetar softwareupdate
sudo softwareupdate --reset-ignored

# para bloquear uma versao especifica use:
sudo softwareupdate --ignore "macOS Tahoe"

# bloqueio de via hosts
# finalizando serviço de dns e limpando cachedns
# baseado em https://setapp.com/how-to/how-to-flush-dns-cache
# talvez seja necessario rodar um script por versão do mac, deixar isso pro "meu eu do futuro" resolver
sudo dscacheutil -flushcache
sudo discoveryutil udnsflushcaches
sudo killall -HUP mDNSResponder

#hosts de update da apple
echo '0.0.0.0 swscan.apple.com
0.0.0.0 swquery.apple.com
0.0.0.0 swdownload.apple.com
0.0.0.0 swcdn.apple.com' | sudo tee -a /private/etc/hosts
