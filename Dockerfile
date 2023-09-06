# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=36.83.0

# Base image
#============
FROM ghcr.io/containerbase/base:9.19.4@sha256:6a468331db72d7b20157c5c2fcd5bc8aef550d6185f72c3c713c4c62c23b0271 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.17.1

# renovate: datasource=npm
RUN install-tool corepack 0.20.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.400


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
