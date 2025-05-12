# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=40.11.7

# Base image
#============
FROM ghcr.io/containerbase/base:13.8.26@sha256:e93481ddd75828744f2b69c0783a14999b263dcf78915f2639867e055a87eab7 AS base

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
