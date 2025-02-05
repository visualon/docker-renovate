# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.161.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.7.7@sha256:43c6259f72b0ab1ea0c03568549fe579bb8fc4c7e1d9f1d642d54119c014bb6c AS base

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
