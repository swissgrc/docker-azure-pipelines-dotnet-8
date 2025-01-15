# Docker image for running .NET 8 in an Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet-8/blob/main/LICENSE) [![Build](https://img.shields.io/github/actions/workflow/status/swissgrc/docker-azure-pipelines-dotnet-8/publish.yml?branch=develop&style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dotnet-8/actions/workflows/publish.yml) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=swissgrc_docker-azure-pipelines-dotnet-8&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=swissgrc_docker-azure-pipelines-dotnet-8) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-dotnet.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dotnet)
<!-- markdownlint-restore -->

🐳 Docker image to run .NET 8 in [Azure Pipelines container jobs].
The image contains also Docker CLI to access Docker engine on the agent.

## Usage

This image can be used to run .NET 8 in [Azure Pipelines container jobs].

### Azure Pipelines Container Job

To use the image in an Azure Pipelines Container Job, add one of the following example tasks and use it with the `container` property.

The following example shows the container used for a deployment step which shows .NET version:

```yaml
  - stage: deploy
    jobs:
      - deployment: runDotNet
        container: swissgrc/azure-pipelines-dotnet:8
        environment: smarthotel-dev
        strategy:
          runOnce:
            deploy:
              steps:
                - bash: |
                    dotnet --version
```

### Tags

| Tag        | Description                                                                                     | Base Image                         | .NET SDK | Size                                                                                                                              |
|------------|-------------------------------------------------------------------------------------------------|------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------|
| 8          | Latest stable release (from `main` branch)                                                      | swissgrc/azure-piplines-git:2.48.1 | 8.0.405  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8?style=flat-square)          |
| 8-unstable | Latest unstable release (from `develop` branch)                                                 | swissgrc/azure-piplines-git:2.48.1 | 8.0.405  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8-unstable?style=flat-square) |
| 8.0.100    | [.NET SDK 8.0.100](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.0/8.0.0.md)   | swissgrc/azure-piplines-git:2.43.0 | 8.0.100  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.100?style=flat-square)    |
| 8.0.101    | [.NET SDK 8.0.101](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.1/8.0.1.md)   | swissgrc/azure-piplines-git:2.43.0 | 8.0.101  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.101?style=flat-square)    |
| 8.0.200    | [.NET SDK 8.0.200](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.2/8.0.2.md)   | swissgrc/azure-piplines-git:2.43.1 | 8.0.200  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.200?style=flat-square)    |
| 8.0.202    | [.NET SDK 8.0.202](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.3/8.0.3.md)   | swissgrc/azure-piplines-git:2.44.0 | 8.0.202  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.202?style=flat-square)    |
| 8.0.203    | [.NET SDK 8.0.203](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.3/8.0.3.md)   | swissgrc/azure-piplines-git:2.44.0 | 8.0.203  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.203?style=flat-square)    |
| 8.0.204    | [.NET SDK 8.0.204](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.4/8.0.4.md)   | swissgrc/azure-piplines-git:2.44.0 | 8.0.204  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.204?style=flat-square)    |
| 8.0.300    | [.NET SDK 8.0.300](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.5/8.0.5.md)   | swissgrc/azure-piplines-git:2.45.1 | 8.0.300  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.300?style=flat-square)    |
| 8.0.301    | [.NET SDK 8.0.301](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.6/8.0.6.md)   | swissgrc/azure-piplines-git:2.45.1 | 8.0.301  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.301?style=flat-square)    |
| 8.0.303    | [.NET SDK 8.0.303](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.7/8.0.7.md)   | swissgrc/azure-piplines-git:2.45.2 | 8.0.303  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.303?style=flat-square)    |
| 8.0.400    | [.NET SDK 8.0.400](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.8/8.0.8.md)   | swissgrc/azure-piplines-git:2.46.0 | 8.0.400  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.400?style=flat-square)    |
| 8.0.401    | [.NET SDK 8.0.401](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.8/8.0.401.md) | swissgrc/azure-piplines-git:2.46.0 | 8.0.401  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.401?style=flat-square)    |
| 8.0.402    | [.NET SDK 8.0.402](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.8/8.0.402.md) | swissgrc/azure-piplines-git:2.46.2 | 8.0.402  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.402?style=flat-square)    |
| 8.0.403    | [.NET SDK 8.0.403](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.10/8.0.10.md) | swissgrc/azure-piplines-git:2.47.0 | 8.0.403  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.403?style=flat-square)    |
| 8.0.404    | [.NET SDK 8.0.404](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.11/8.0.11.md) | swissgrc/azure-piplines-git:2.47.0 | 8.0.404  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.404?style=flat-square)    |
| 8.0.405    | [.NET SDK 8.0.405](https://github.com/dotnet/core/blob/main/release-notes/8.0/8.0.12/8.0.12.md) | swissgrc/azure-piplines-git:2.48.1 | 8.0.405  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dotnet/8.0.405?style=flat-square)    |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
