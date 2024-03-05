# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.229.0

# Base image
#============
FROM ghcr.io/containerbase/base:10.2.3@sha256:d59671b0b497d0a3ce9360ecfc99cfc2ba4d8e3cbeb41daaa66e7f3b4261991d AS base

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
