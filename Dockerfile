# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.143.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.18.2@sha256:0e415159aaf15a0f4b5809a7b233f5e462c4558e021d345f479ab350c459df34 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.20.0

# renovate: datasource=npm
RUN install-tool pnpm 10.18.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.305


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
