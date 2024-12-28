# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.83.4

# Base image
#============
FROM ghcr.io/containerbase/base:13.5.4@sha256:52778caebf07b8accafad75a4daa0363e291ccc7d6cad19bf17bc2dcf274302c AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.12.0

# renovate: datasource=npm
RUN install-tool pnpm 9.15.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 8.0.404


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
