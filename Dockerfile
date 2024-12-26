# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=39.83.2

# Base image
#============
FROM ghcr.io/containerbase/base:13.5.2@sha256:6457c31a4f2770b0fa9651f743ca7c3e988b263b45a8550a7182ca0b1ad21c52 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 22.12.0

# renovate: datasource=npm
RUN install-tool pnpm 9.15.1

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 8.0.404


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
