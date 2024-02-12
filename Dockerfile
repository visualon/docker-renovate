# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.183.0

# Base image
#============
FROM ghcr.io/containerbase/base:9.33.8@sha256:6def053e3b358b900d377affdbd0d64fad0e5b0ecbedc0773545a432a5fc5e26 AS base

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
