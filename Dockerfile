# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=36.1.4

# Base image
#============
FROM ghcr.io/containerbase/base:9.1.1@sha256:9355410c8f812eac30f0a508d7f7627fd803bd705b3a629c7408077b6d0d4ccb AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.16.1

# renovate: datasource=npm
RUN install-tool corepack 0.19.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.305


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
