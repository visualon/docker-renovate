# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=38.122.0

# Base image
#============
FROM ghcr.io/containerbase/base:12.0.4@sha256:b2c5f5e280d0192942691cf8e74424fbca24b28a5d82b6426725d760b512c7de AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.18.0

# renovate: datasource=npm
RUN install-tool corepack 0.29.4

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.403


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
