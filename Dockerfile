# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.74.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.4.5@sha256:c0b402890bfc22a8c1bb6fd4bd5687397d390d5936fa441f94800a08eadbe273 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.12.0

# renovate: datasource=npm
RUN install-tool pnpm 9.15.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.404


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
