Set-ExecutionPolicy Bypass Process -Force
#
# Disable IE Security Configuration
#
$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0
Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0
Stop-Process -Name Explorer
Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green
#
# Install Chocolatery
#
Invoke-Expression ((New-Object System.Net.Webclient).downloadstring('https://chocolatey.org/install.ps1'))
$packages = 'git'
ForEach ($packagename in $packages)
{
    choco install $packagename -y
}
Restart-Computer