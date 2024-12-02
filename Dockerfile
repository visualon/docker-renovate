# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.44.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.0.24@sha256:5015941c82e6143de4c1c0afbea6e9a6183cf60fb0ee7d8b47ff3ec9dfa03b69 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.11.0

# renovate: datasource=npm
RUN install-tool corepack 0.30.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.404


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
