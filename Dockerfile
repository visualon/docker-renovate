# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.61.0

# Base image
#============
FROM ghcr.io/containerbase/base:7.8.6@sha256:d5b5bfdac94337930559be51e8beefa4e21ac693723a98f38cdd97f4082754c1 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.16.0

# renovate: datasource=npm
RUN install-tool corepack 0.17.2

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.203


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
