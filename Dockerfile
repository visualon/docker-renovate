# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.261.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.17@sha256:24a4dd4ac98c5f9cedaaae344b84157106d9538f97720a48be4e652fc04fee07 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.15.0

# renovate: datasource=npm
RUN install-tool pnpm 10.9.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.203


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
