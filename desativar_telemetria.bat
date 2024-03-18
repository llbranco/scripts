sc delete DiagTrack

sc delete dmwappushservice

echo ““ > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f


::News app
::Get-AppxPackage *BingNews* | Remove-AppxPackage

::Weather
Get-AppxPackage *BingWeather* | Remove-AppxPackage

::Music app
Get-AppxPackage *ZuneMusic* | Remove-AppxPackage

::MS Office
Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage

::People app
Get-AppxPackage *People* | Remove-AppxPackage

::Maps
::Get-AppxPackage *WindowsMaps* | Remove-AppxPackage

::Help and tips
Get-AppxPackage *GetHelp* | Remove-AppxPackage

::Feedback Hub
Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage

::Microsoft To-Do
Get-AppxPackage *Todos* | Remove-AppxPackage

::Teams/Chat
Get-AppxPackage *Teams* | Remove-AppxPackage

::Your Phone
Get-AppxPackage *YourPhone* | Remove-AppxPackage

::Solitaire Collection
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage

::OneDrive
Get-AppxPackage *OneDriveSync* | Remove-AppxPackage

::Skype
Get-AppxPackage *SkypeApp* | Remove-AppxPackage

::Xbox Console Companion
::Get-AppxPackage *GamingApp* | Remove-AppxPackage