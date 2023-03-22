# renovate: datasource=npm depName=renovate versioning=npm
ARG RENOVATE_VERSION=35.17.1

# Base image
#============
FROM ghcr.io/containerbase/base:6.9.0@sha256:371b51ebd43650b7fd44c4bebf4583052ef52574fe0c26a36d493759a8dd8495 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.15.0

# renovate: datasource=npm
RUN install-tool corepack 0.17.1

# renovate: datasource=dotnet-version lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.202


ARG RENOVATE_VERSION

RUN install-tool renovate

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER ${USER_ID}
