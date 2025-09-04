# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.96.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.10.14@sha256:428d383d26277041b2dba63e73ead1d4eef5395ba89885ba92fafa24ee92c3d0 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.19.0

# renovate: datasource=npm
RUN install-tool pnpm 10.15.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.304


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
