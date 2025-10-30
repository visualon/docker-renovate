# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.165.6

# Base image
#============
FROM ghcr.io/containerbase/base:13.23.13@sha256:1f7baea4b19866e05e62874308a39f1a485c4e46b59c7e3742ab7095dca135bc AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.21.1

# renovate: datasource=npm
RUN install-tool pnpm 10.19.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.306


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
