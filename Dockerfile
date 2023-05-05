# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.71.4

# Base image
#============
FROM ghcr.io/containerbase/base:7.9.0@sha256:9ecd90a3721fd4485ccbbbb85f119f6c433c6bf16eaa8a1e0f28a491a54777d4 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.16.0

# renovate: datasource=npm
RUN install-tool corepack 0.17.2

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.203


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
