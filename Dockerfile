# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.130.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.7.0@sha256:d07beeac908f2dc61274b1f563daaec1896753a18886361cc2beafd51857c919 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.13.1

# renovate: datasource=npm
RUN install-tool pnpm 9.15.4

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 8.0.405


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
