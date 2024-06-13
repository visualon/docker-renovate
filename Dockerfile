# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=37.407.2

# Base image
#============
FROM ghcr.io/containerbase/base:10.11.5@sha256:05dab0c553364ed09dfad04528be82c57007778f1f9def5e47498ee03484a1ba AS base

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
