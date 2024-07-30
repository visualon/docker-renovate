# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=38.11.0

# Base image
#============
FROM ghcr.io/containerbase/base:11.2.0@sha256:62b0670c37a2b00c8bd7a9d55c956a40c95a18bc946ec5b6aed3b43f9aba4d71 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.16.0

# renovate: datasource=npm
RUN install-tool corepack 0.29.3

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.303


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
