# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.18.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.48@sha256:5a9fc85a657efb45bf77656a2ab641fa3b507dda62d2e648e5ade2d555ba4d23 AS base

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
