# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.161.4

# Base image
#============
FROM ghcr.io/containerbase/base:13.7.8@sha256:53a64e921c789bec807cd34a2568bc276b8f23038484de3278f785948db2d62a AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.13.1

# renovate: datasource=npm
RUN install-tool pnpm 10.1.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.102


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
