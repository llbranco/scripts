@echo off
@title Habilitar Dotnet3.5 windows 7
::dism /online /enable-feature /featurename:NetFx3
::dism /online /enable-feature /featurename:WCF-HTTP-Activation
::dism /online /enable-feature /featurename:WCF-NonHTTP-Activation
@echo on
@Dism.exe /online /Enable-Feature /FeatureName:IIS-WebServerRole /FeatureName:IIS-WebServerRole /FeatureName:IIS-WebServer /FeatureName:IIS-ApplicationDevelopment /FeatureName:IIS-Security /FeatureName:IIS-RequestFiltering /FeatureName:IIS-NetFxExtensibility /FeatureName:WAS-WindowsActivationService /FeatureName:WAS-ProcessModel /FeatureName:WAS-NetFxEnvironment /FeatureName:WAS-ConfigurationAPI /FeatureName:NetFx3 /FeatureName:WCF-HTTP-Activation /FeatureName:WCF-NonHTTP-Activation
@echo off
pause
