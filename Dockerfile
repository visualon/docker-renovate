# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.252.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.14@sha256:ff57d05ee75a288878b9be45e9d27d478b2a14ed485ca96b359339e8bd9001c8 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.8.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.203


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
