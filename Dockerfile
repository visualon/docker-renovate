# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.17.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.46@sha256:2718850f952fff28ef8c4ce58416f1dd4fb42a4042020766d5d6ac6e24e61bda AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.17.0

# renovate: datasource=npm
RUN install-tool pnpm 10.12.4

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.301


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
