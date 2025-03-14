# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.202.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.6@sha256:bc2b203b2193ba7de7df5424f8275afd5ee35fb134f1add80c6794bebada177f AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.6.3

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.201


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
