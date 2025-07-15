# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.35.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.58@sha256:d43040df2900da38d2b925a0f398248add0a33b973169459cedea80505fd0bbb AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.17.0

# renovate: datasource=npm
RUN install-tool pnpm 10.13.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.302


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
