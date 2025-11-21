# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=42.19.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.25.0@sha256:bab915d39f1e410fc5371d7f69a80ba0561a47221e261c0ca77aa9e7beb04ae2 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.11.1

# renovate: datasource=npm
RUN install-tool pnpm 10.22.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 10.0.100


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
