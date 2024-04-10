# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.282.1

# Base image
#============
FROM ghcr.io/containerbase/base:10.3.13@sha256:07057011001be8149ffc113f364d88a5b8e768a08562f73d9f65e4b72c56d105 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.12.2

# renovate: datasource=npm
RUN install-tool corepack 0.26.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.204


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
