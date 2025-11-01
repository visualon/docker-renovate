# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.168.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.23.15@sha256:ff5ec3d319d6acb61f6915826230844064463dafe5882d3cf1d5028951686271 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.21.1

# renovate: datasource=npm
RUN install-tool pnpm 10.20.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.306


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
