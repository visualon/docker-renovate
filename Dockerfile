# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.86.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.5.7@sha256:627978b5b635e45a463641dd0279650106cb36c70a83eaeba1839088a1e938b6 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.12.0

# renovate: datasource=npm
RUN install-tool pnpm 9.15.2

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 8.0.404


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
