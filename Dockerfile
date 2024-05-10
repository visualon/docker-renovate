# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.354.1

# Base image
#============
FROM ghcr.io/containerbase/base:10.6.7@sha256:22999ddc3c1ae02ec2c12d15500063dfb9b008ce2d819a2ac22b8cb866e5cd73 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.13.1

# renovate: datasource=npm
RUN install-tool corepack 0.28.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.204


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
