# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.144.3

# Base image
#============
FROM ghcr.io/containerbase/base:13.18.3@sha256:6dce3dfd7a3e1a3913e49199a91a2a336938dcd70919c8dfdd754feb9b0c4e21 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.20.0

# renovate: datasource=npm
RUN install-tool pnpm 10.18.2

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.305


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
