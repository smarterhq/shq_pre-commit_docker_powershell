FROM mcr.microsoft.com/powershell:preview-alpine-3.10

RUN pwsh -c "Set-PSRepository PSGallery -InstallationPolicy Trusted; Install-Module PSScriptAnalyzer -Force"
