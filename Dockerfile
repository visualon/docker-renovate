# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=36.55.0

# Base image
#============
FROM ghcr.io/containerbase/base:9.13.2@sha256:c123cfd11cd0360eab4f5f8b886085fac53d19185a800851a34fa6e27fd174b5 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.17.1

# renovate: datasource=npm
RUN install-tool corepack 0.19.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.400


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
