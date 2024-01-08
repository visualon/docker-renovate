# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.127.0

# Base image
#============
FROM ghcr.io/containerbase/base:9.31.3@sha256:3b07361a05a00c89b721f078f5bf0ee3d0e8ae2dcd8f51d8e86a9dc2ef5e7b7e AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.10.0

# renovate: datasource=npm
RUN install-tool corepack 0.24.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.100


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
