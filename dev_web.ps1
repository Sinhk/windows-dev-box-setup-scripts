# Description: Boxstarter Script
# Author: Microsoft
# Common settings for web dev

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "CommonDevTools.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "HyperV.ps1";
executeScript "Docker.ps1";
executeScript "WSL.ps1";
executeScript "Browsers.ps1";
RefreshEnv
#--- Tools ---
choco install -y azure-cli

code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge
code --install-extension EditorConfig.EditorConfig
code --install-extension ms-vscode.PowerShell
code --install-extension ms-vscode.csharp

choco install -y dotnetcore-sdk 
choco install -y visualstudio2019community 
choco install -y visualstudio2019-workload-netweb 
choco install -y visualstudio2019-workload-netcoretools 

#--- Microsoft WebDriver ---
choco install -y microsoftwebdriver

#--- Extra Stuff ---
Disable-GameBarTips
Disable-BingSearch
choco install -y adobereader 
choco install -y adobereader-update
choco install -y steam
choco install -y origin 
choco install -y uplay 
choco install -y goggalaxy 
choco install -y k-litecodecpackfull
choco install -y wget
choco install -y windirstat
choco install -y jetbrainstoolbox 
choco install -y curl
choco install -y dropbox
choco install -y filezilla
choco install -y gradle
choco install -y spotify
choco install -y teamviewer
choco install -y calibre
choco install -y notepadplusplus.install
choco install -y hwmonitor
choco install -y keepass
choco install -y keepass-keepasshttp
choco install -y keepass-plugin-keeanywhere
choco install -y launchy
choco install -y office365proplus


Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula -Full
