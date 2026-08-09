ARG RENOVATE_VERSION=44.17.1@sha256:90759c92793143ae7db68cd14e690109d8ace3527e17c7d188c96a1ad628282e

FROM ghcr.io/renovatebot/renovate:${RENOVATE_VERSION} AS build

# Base image
#============
FROM ghcr.io/containerbase/base:14.13.18@sha256:32bd7f74ca9e59db869f8f8fc5470c0da6f606b65031bafe7af12de33d80eb0a AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.19.0

# renovate: datasource=npm
RUN install-tool pnpm 11.20.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 10.0.302


COPY --link --from=build --chown=root:root /usr/local/sbin/ /usr/local/sbin/
COPY --link --from=build --chown=root:root /usr/local/renovate/ /usr/local/renovate/


ARG RENOVATE_VERSION

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
