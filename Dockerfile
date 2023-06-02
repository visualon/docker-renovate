# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.108.0

# Base image
#============
FROM ghcr.io/containerbase/base:8.0.0@sha256:88a085f024e7087ba4de3eaa2c97016515462d83fa4fa25bb8b220bcd73128d3 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.16.0

# renovate: datasource=npm
RUN install-tool corepack 0.18.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.302


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
