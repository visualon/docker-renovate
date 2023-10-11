# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.13.2

# Base image
#============
FROM ghcr.io/containerbase/base:9.20.11@sha256:9bd603648e648ba5c80cb48f7292c46c9523b4786c6d10320d44a50aad7b7eeb AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.18.1

# renovate: datasource=npm
RUN install-tool corepack 0.20.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.402


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
