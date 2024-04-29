# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.329.0

# Base image
#============
FROM ghcr.io/containerbase/base:10.5.1@sha256:f8312bb7daa53d6a6c825af1dc753a772060a6053c078e0c4164382858476ae3 AS base

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
