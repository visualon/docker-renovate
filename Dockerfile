# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.117.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.5.10@sha256:20b2d69890a08b6587373db4cc17d513322118bdf7961b96b946dfb55bdfc06f AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.13.0

# renovate: datasource=npm
RUN install-tool pnpm 9.15.4

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 8.0.405


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
