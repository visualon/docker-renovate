# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=40.56.3

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.41@sha256:78888c1d58a555a4b98077be3a1dfaaffd01a7db813dd9b00f66e564cf4a5cbc AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.16.0

# renovate: datasource=npm
RUN install-tool pnpm 10.12.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.301


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
