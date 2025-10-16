# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.151.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.23.0@sha256:cb4ed10e6f554ea0d83a0cd5b7b933e1dd012ba8ee744263e8191e44de71974f AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.20.0

# renovate: datasource=npm
RUN install-tool pnpm 10.18.3

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.306


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
