# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.238.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.13@sha256:3006b388b19d757f4056da1b317a39213b8c4fea1bd64c44f17ef9cd1ead81d4 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.8.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.203


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
