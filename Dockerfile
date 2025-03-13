# Base image containing dependencies used in builder and final image
FROM ghcr.io/swissgrc/azure-pipelines-git:2.48.1 AS base

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Builder image
FROM base AS build

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add .NET PPA
ADD https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb /tmp/packages-microsoft-prod.deb
RUN  dpkg -i /tmp/packages-microsoft-prod.deb && \
  rm -rf /tmp/*

# Final image
FROM base AS final

LABEL org.opencontainers.image.vendor="Swiss GRC AG"
LABEL org.opencontainers.image.authors="Swiss GRC AG <opensource@swissgrc.com>"
LABEL org.opencontainers.image.title="azure-pipelines-dotnet"
LABEL org.opencontainers.image.documentation="https://github.com/swissgrc/docker-azure-pipelines-dotnet-8"

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /
# Copy .NET keyring
COPY --from=build /usr/share/keyrings/microsoft-prod.gpg /usr/share/keyrings/microsoft-prod.gpg
COPY --from=build /etc/apt/sources.list.d/ /etc/apt/sources.list.d

# Install fontconfig

# renovate: datasource=repology depName=debian_12/fontconfig versioning=deb
ENV FONTCONFIG_VERSION=2.14.1-4

RUN apt-get update -y && \
  # Install necessary dependencies
  apt-get install -y --no-install-recommends fontconfig=${FONTCONFIG_VERSION} && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install .NET 8

# renovate: datasource=github-tags depName=dotnet/sdk extractVersion=^v(?<version>.*)$
ENV DOTNET_VERSION=8.0.407

ENV \
    # Do not show first run text
    DOTNET_NOLOGO=true \
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true \
    # Disable telemetry
    DOTNET_CLI_TELEMETRY_OPTOUT=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps performance
    NUGET_XMLDOC_MODE=skip

RUN apt-get update -y && \
  # Install .NET 8
  apt-get install -y --no-install-recommends dotnet-sdk-8.0=${DOTNET_VERSION}-1 && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  # Smoke test
  dotnet --version
