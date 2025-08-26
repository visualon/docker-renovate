# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.85.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.10.11@sha256:fdd802425ea9d307f6e6f80eadeddf764f72b5a651dbd03f94fb7cd9e31cfac5 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.18.0

# renovate: datasource=npm
RUN install-tool pnpm 10.15.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.304


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
