# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.408.3

# Base image
#============
FROM ghcr.io/containerbase/base:10.11.6@sha256:227eededf755714cd9e98c9dda94f292f9c6fa81994dbd49fe5a8851d08fba70 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.14.0

# renovate: datasource=npm
RUN install-tool corepack 0.28.2

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.302


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
