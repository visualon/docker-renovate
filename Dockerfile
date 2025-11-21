# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=42.19.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.25.1@sha256:d91b2ea004ca58164a9c36aef4ad92256a6e6cf5899d7e58a9fcbd46bd36f7c6 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.11.1

# renovate: datasource=npm
RUN install-tool pnpm 10.22.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 10.0.100


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
