FROM mcr.microsoft.com/powershell:preview-alpine-3.10

RUN pwsh -c "Save-Module -Name PSScriptAnalyzer -Path /root/.local/share/powershell/Modules"
RUN pwsh -c "Import-Module PSScriptAnalyzer"

CMD [ "pwsh" ]
