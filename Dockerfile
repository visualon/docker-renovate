# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=42.1.3

# Base image
#============
FROM ghcr.io/containerbase/base:13.24.0@sha256:92a9bc4a65e23c0ad813a651138f4b4610daa8bddd25767c71877262f60ec7b4 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.11.0

# renovate: datasource=npm
RUN install-tool pnpm 10.20.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.306


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
