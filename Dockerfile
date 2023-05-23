# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.98.7

# Base image
#============
FROM ghcr.io/containerbase/base:7.10.0@sha256:6034882913c545489efe21181ea50ea2bf5452062489097349402a3fa0e7f051 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.16.0

# renovate: datasource=npm
RUN install-tool corepack 0.18.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.302


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
