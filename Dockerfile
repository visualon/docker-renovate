# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.33.3

# Base image
#============
FROM ghcr.io/containerbase/base:9.23.6@sha256:7eb71b5bcc0d67e1a60d8585895eab75b2ab131d9502331234feb458e82b09a5 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.18.2

# renovate: datasource=npm
RUN install-tool corepack 0.22.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.403


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
