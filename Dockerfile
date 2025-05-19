# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=40.16.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.27@sha256:dd439ff198510680e3074bc47f2615ed21cc42932c57d38c160491bd0c62b28c AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.15.1

# renovate: datasource=npm
RUN install-tool pnpm 10.11.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.300


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
