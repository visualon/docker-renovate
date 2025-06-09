# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=40.48.9

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.37@sha256:63e55d7e39f3a3de00357b76f2e1a93054ce65c5b8c9bd816898e877b053706a AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.16.0

# renovate: datasource=npm
RUN install-tool pnpm 10.11.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.300


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
