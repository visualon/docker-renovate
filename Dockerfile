# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.253.5

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.15@sha256:45c70a981a75281403a932f0714b8c0b63e0eb9b115b2134e7af05b4e626de83 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.8.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.203


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
