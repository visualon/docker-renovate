# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=41.73.1

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.65@sha256:948e09d87b2a0abace8af72f602134cf96c9ba6c22530e62d29f826e3eae30a7 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.18.0

# renovate: datasource=npm
RUN install-tool pnpm 10.14.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.304


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
