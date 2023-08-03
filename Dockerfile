# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=36.29.1

# Base image
#============
FROM ghcr.io/containerbase/base:9.8.4@sha256:24ad38ffdeeccf3e51bb249a2b0f9ca111310f381cb802769fece86b7d5970ff AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.17.0

# renovate: datasource=npm
RUN install-tool corepack 0.19.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.306


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
