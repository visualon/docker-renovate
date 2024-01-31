# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.163.1

# Base image
#============
FROM ghcr.io/containerbase/base:9.31.6@sha256:f3327e9a65c946750217aad95c2e97c2fd3c730ed0920fa348e488343d0a5da3 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.11.0

# renovate: datasource=npm
RUN install-tool corepack 0.24.1

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.101


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
