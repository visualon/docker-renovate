# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.124.1

# Base image
#============
FROM ghcr.io/containerbase/base:9.0.2@sha256:4cc8a02e8f8a24c2cd94fcd6f54a79b45938c51850fb7d6f020eb0ed1ecfb0f1 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.16.0

# renovate: datasource=npm
RUN install-tool corepack 0.18.1

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.304


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
