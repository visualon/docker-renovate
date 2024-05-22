# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.374.3

# Base image
#============
FROM ghcr.io/containerbase/base:10.6.14@sha256:b6002ebc28117d34b49322955d2cff49745363012d36930ab739f3ec7575947a AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.13.1

# renovate: datasource=npm
RUN install-tool corepack 0.28.1

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.300


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
