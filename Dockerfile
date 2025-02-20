# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.176.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.7.16@sha256:68cabfb4331a8d35a73bb85c418974a7e1e0298a60a9fd94e20fb3ba4b81fd25 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.4.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.200


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
