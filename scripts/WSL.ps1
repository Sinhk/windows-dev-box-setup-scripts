choco install -y wsl
choco install -y wsl-debiangnulinux
choco install -y wsl-ubuntu-1804 

RefreshEnv
if (Test-PendingReboot) { Invoke-Reboot }
wsl -d apt ubuntu-18.04 update
wsl -d apt ubuntu-18.04 run apt upgrade -y
wsl -d apt debian run apt update
wsl -d apt debian run apt upgrade -y


<#
NOTE: Other distros can be scripted the same way for example:

#--- SLES --- 
# Install SLES Store app
Invoke-WebRequest -Uri https://aka.ms/wsl-sles-12 -OutFile ~/SLES.appx -UseBasicParsing
Add-AppxPackage -Path ~/SLES.appx
# Launch SLES
sles-12.exe

# --- openSUSE ---
Invoke-WebRequest -Uri https://aka.ms/wsl-opensuse-42 -OutFile ~/openSUSE.appx -UseBasicParsing
Add-AppxPackage -Path ~/openSUSE.appx
# Launch openSUSE
opensuse-42.exe
#>

