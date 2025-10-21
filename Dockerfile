# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.156.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.23.5@sha256:281c8e901db51dc075abab84cccade455e12fe352aba315aecb32cd8ff1521c6 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.20.0

# renovate: datasource=npm
RUN install-tool pnpm 10.18.3

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.306


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
