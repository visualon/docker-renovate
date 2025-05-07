# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=40.7.0

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.19@sha256:9281238e473eac08507992ad297d02fc597c42a9db9aec800a5088772efcae69 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.15.0

# renovate: datasource=npm
RUN install-tool pnpm 10.10.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 9.0.203


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
