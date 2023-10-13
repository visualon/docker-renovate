# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.18.1

# Base image
#============
FROM ghcr.io/containerbase/base:9.23.1@sha256:0f43b97350b7151ac7b396d8f4a6e4e8387de185764c602343c2b20a5879cb6d AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.18.1

# renovate: datasource=npm
RUN install-tool corepack 0.21.0

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.402


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
