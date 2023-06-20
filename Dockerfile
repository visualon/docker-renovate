# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.137.0

# Base image
#============
FROM ghcr.io/containerbase/base:9.0.3@sha256:20a90aa24e9f6a70ccbb5274553001201cabd42437f4412cb9c5d6f1bde05906 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.16.0

# renovate: datasource=npm
RUN install-tool corepack 0.18.1

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.304


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
