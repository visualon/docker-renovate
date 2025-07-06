# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.21.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.49@sha256:0da349058b0a754d2871e8084495458a3f316fc13594c71000993e2524f954ed AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.17.0

# renovate: datasource=npm
RUN install-tool pnpm 10.12.4

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.301


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
