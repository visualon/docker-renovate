# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.158.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.7.5@sha256:cf716be71cfd908afb59074739938f55857ff9d756665533be3ae61fb29306df AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.13.1

# renovate: datasource=npm
RUN install-tool pnpm 10.1.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.102


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
