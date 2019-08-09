choco install -y wsl-debiangnulinux
choco pin add -n=wsl-debiangnulinux
choco install -y wsl-ubuntu-1804 
choco pin add -n=wsl-ubuntu-1804

RefreshEnv
if (Test-PendingReboot) { Invoke-Reboot }
wsl -d ubuntu-18.04 apt-get update
wsl -d ubuntu-18.04 apt-get upgrade -y
wsl -d debian apt-get update
wsl -d debian apt-get upgrade -y


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

