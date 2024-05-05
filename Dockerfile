# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.340.9

# Base image
#============
FROM ghcr.io/containerbase/base:10.6.1@sha256:9f302797b4cce825693829d5c3435ffee9fc340e4e3356ff82347c476d039732 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.12.2

# renovate: datasource=npm
RUN install-tool corepack 0.28.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.204


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
