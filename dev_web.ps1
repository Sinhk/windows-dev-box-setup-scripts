# Description: Boxstarter Script
# Author: Microsoft
# Common settings for web dev

Update-ExecutionPolicy Unrestricted 
Disable-UAC
Set-TaskbarOptions -Size Small -Combine Full 
if (Test-PendingReboot) { Invoke-Reboot }

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

Install-WindowsUpdate -AcceptEula 
if (Test-PendingReboot) { Invoke-Reboot }
Disable-MicrosoftUpdate

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
if (Test-PendingReboot) { Invoke-Reboot }
executeScript "SystemConfiguration.ps1";
executeScript "CommonDevTools.ps1";
if (Test-PendingReboot) { Invoke-Reboot }
executeScript "RemoveDefaultApps.ps1";
if (Test-PendingReboot) { Invoke-Reboot }
executeScript "HyperV.ps1";
if (Test-PendingReboot) { Invoke-Reboot }
executeScript "Docker.ps1";
if (Test-PendingReboot) { Invoke-Reboot }
executeScript "WSL.ps1";
if (Test-PendingReboot) { Invoke-Reboot }
executeScript "Browsers.ps1";
RefreshEnv
if (Test-PendingReboot) { Invoke-Reboot }
#--- Tools ---
choco install -y azure-cli

code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge
code --install-extension EditorConfig.EditorConfig
code --install-extension ms-vscode.PowerShell
code --install-extension ms-vscode.csharp

choco install -y dotnetcore-sdk
if (Test-PendingReboot) { Invoke-Reboot }

choco install -y visualstudio2019community 
choco install -y visualstudio2019-workload-netweb 
choco install -y visualstudio2019-workload-netcoretools 

choco install -y Containers-DisposableClientVM -source WindowsFeatures
#--- Microsoft WebDriver ---
choco install -y microsoftwebdriver

if (Test-PendingReboot) { Invoke-Reboot }
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
choco install -y razer-synapse-2
if (Test-PendingReboot) { Invoke-Reboot }

Update-ExecutionPolicy RemoteSigned
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
