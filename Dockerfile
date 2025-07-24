# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.43.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.61@sha256:1a2ea1bf6557bf9d988d2830e9b85c1e74b38f330e15731e4920da7c0854debd AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.17.1

# renovate: datasource=npm
RUN install-tool pnpm 10.13.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.303


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
