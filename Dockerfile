# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.159.3

# Base image
#============
FROM ghcr.io/containerbase/base:13.23.8@sha256:ae212c6ef8d5b10de151426fe0207e5472fd4e65962af656f1d8f35f5971c8ff AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.21.0

# renovate: datasource=npm
RUN install-tool pnpm 10.18.3

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.306


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
