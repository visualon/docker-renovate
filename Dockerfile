# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.220.3

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.8@sha256:34251c4bc8b6bbaeb8853a63823e67093b6e4071bb533154b7e1d00f7d483d85 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.6.5

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.202


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
