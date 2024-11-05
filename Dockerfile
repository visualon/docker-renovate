# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.1.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.0.5@sha256:7387ee77d85a0a2311a4b692e44a08f04edb3a115f644d7c8f36b770763d699d AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.11.0

# renovate: datasource=npm
RUN install-tool corepack 0.29.4

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.403


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
