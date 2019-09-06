shq_pre-commit_docker_powershell
========================

## What is this?

This is a proof-of-concept of providing a [pre-commit](http://pre-commit.com) hook for powershell executed scriptanalyzer via docker.

## How does this work?

`pre-commit` by convention mounts the user's code at `/src` inside the container. The executable is fed relative path filename arguments. The hook may make changes to the files as the source is mounted read-write and the executables are run as the user.

A few key lines in the `Dockerfile` make this work:

```dockerfile
RUN pwsh -c "Set-PSRepository PSGallery -InstallationPolicy Trusted; Install-Module PSScriptAnalyzer -Force"
```

This enables pulling down powershell modules from PSGallery and installs the module; PSScriptAnalyzer.

Lastly, the metadata in hooks.yaml hooks this up:

```yaml
    entry: Invoke-ScriptAnalyzer -ScriptDefinition
    language: docker
```

Here `Invoke-ScriptAnalyzer -ScriptDefinition` is the executable inside the container and we tell `pre-commit` that the language is `docker`.


## How would I use this repository with pre-commit?

Well, you probably shouldn't (at least yet anyways...) but if you really wanted to you could add this to your `.pre-commit-config.yaml`:

```yaml
-   repo: https://github.com/smarterhq/shq_pre-commit_docker_powershell
    rev: master  # Fill this in with a current revision
    hooks:
    -   id: powershell-scriptanalyzer-docker
```

You'll also want to use at least version 1.18.3 of pre-commit (as that's what this has been tested on only).
