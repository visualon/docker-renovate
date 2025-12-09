ARG RENOVATE_VERSION=42.42.0@sha256:2dd53d6d26597fb3e32f87633c2494b1b3a5dcd9ce30b6966d2efe27c8b87a67

FROM ghcr.io/renovatebot/renovate:${RENOVATE_VERSION} AS build

# Base image
#============
FROM ghcr.io/containerbase/base:13.25.12@sha256:99bce8e2f74678d1cd96a2e39a3abf7349f6821965f2d7565361665363454df4 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.11.1

# renovate: datasource=npm
RUN install-tool pnpm 10.24.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 10.0.100


COPY --link --from=build --chown=root:root /usr/local/sbin/ /usr/local/sbin/
COPY --link --from=build --chown=root:root /usr/local/renovate/ /usr/local/renovate/


ARG RENOVATE_VERSION

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
