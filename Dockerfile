# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.170.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.7.14@sha256:cb641361951a5b74ad4ae653d389f6a37cc04010f44886fee4e527779ec7f892 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.3.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.200


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
