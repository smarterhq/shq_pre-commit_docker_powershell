FROM mcr.microsoft.com/powershell:preview-alpine-3.10

RUN pwsh -c "Set-PSRepository PSGallery -InstallationPolicy Trusted"
RUN pwsh -c "Install-Module PSScriptAnalyzer"

CMD [ "pwsh" ]
