ARG RENOVATE_VERSION=44.35.3@sha256:970eaeac5fa4d196bfe14ea2bd4466a5eac1827fe062867a58d54e32984b8da5

FROM ghcr.io/renovatebot/renovate:${RENOVATE_VERSION} AS build

# Base image
#============
FROM ghcr.io/containerbase/base:14.14.0@sha256:24c1db35e10fdda5a3d851613b8a74f772fd96eb84a451aec5a5283ec643bc99 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.19.0

# renovate: datasource=npm
RUN install-tool pnpm 11.22.0

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 10.0.400


COPY --link --from=build --chown=root:root /usr/local/sbin/ /usr/local/sbin/
COPY --link --from=build --chown=root:root /usr/local/renovate/ /usr/local/renovate/


ARG RENOVATE_VERSION

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
