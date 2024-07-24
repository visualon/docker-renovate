# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.440.6

# Base image
#============
FROM ghcr.io/containerbase/base:10.16.0@sha256:b039aa654299e4d6d17e1fe0f868a659b9aaf88adb08a2745279b48a3af8e268 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 20.15.1

# renovate: datasource=npm
RUN install-tool corepack 0.29.3

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 8.0.303


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
