# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=38.87.0

# Base image
#============
FROM ghcr.io/containerbase/base:11.11.17@sha256:2d4acc13b697a6345b6cd53e263f10c3ad6ebd1c7d63fcf13513d93590857aaa AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.17.0

# renovate: datasource=npm
RUN install-tool corepack 0.29.4

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.401


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
