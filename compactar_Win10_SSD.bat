compact.exe /CompactOS:always

compact /c /s /a /i /f /exe:xpress16k "C:\Program Files\*"
compact /c /s /a /i /f /exe:xpress16k "C:\Program Files (x86)\*"
compact /c /s /a /i /exe:lzx "C:\ProgramData\*"
compact /c /s /a /i /exe:lzx "C:\Windows\System32\DriverStore\*"

compact /c /s /a /i /exe:lzx "%homeDrive%\MSOCache\*"
compact /c /s /a /i /exe:lzx "%windir%\assembly\*"
compact /c /s /a /i /exe:lzx "%windir%\inf\*"
compact /c /s /a /i /exe:lzx "%windir%\infused apps\*"
compact /c /s /a /i /exe:lzx "%windir%\installer\*"


compact /c /s /a /i /exe:xpress16k "%windir%\Fonts\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\InfusedApps\*" 
compact /c /s /a /i /exe:lzx "%windir%\Installer\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\Panther\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\SoftwareDistribution\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\System32\Catroot2\*" 
compact /c /s /a /i /exe:xpress16k "%windir%\System32\LogFiles\*" 