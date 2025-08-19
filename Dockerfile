# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.81.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.10.7@sha256:0e7f67a6279b8236f83956a79486919c9d2d8dd9a0cd4867b9355044cda749e1 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.18.0

# renovate: datasource=npm
RUN install-tool pnpm 10.14.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.304


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
