# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.221.4

# Base image
#============
FROM ghcr.io/containerbase/base:10.2.1@sha256:3173ed233efca8e9cd23da1247e0fefa4430424e5092cba9fc386c859e96cb2a AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.11.1

# renovate: datasource=npm
RUN install-tool corepack 0.25.2

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.201


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
