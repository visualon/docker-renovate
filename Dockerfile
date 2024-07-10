# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.427.0

# Base image
#============
FROM ghcr.io/containerbase/base:10.15.3@sha256:37567978df0d946a1d9fd355bc9cc2317bea3f8158c637c8e8d4ef42a9d34af9 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.15.1

# renovate: datasource=npm
RUN install-tool corepack 0.28.2

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.303


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
