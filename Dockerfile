# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.128.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.14.2@sha256:128526614629028ce06a3383e96a9a4ed78f32008886ade364e5d552cd23eb02 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.19.0

# renovate: datasource=npm
RUN install-tool pnpm 10.17.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.305


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
