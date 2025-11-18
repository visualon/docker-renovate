# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=42.13.5

# Base image
#============
FROM ghcr.io/containerbase/base:13.24.3@sha256:72b10305f0d7ac3eb4208d622d5ca9338c8184a312e28dbd7bdf91de79a21e10 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.11.1

# renovate: datasource=npm
RUN install-tool pnpm 10.22.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.307


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
