ARG RENOVATE_VERSION=43.59.5@sha256:b13124f0c42387cbf3702f02d40eae5521dc8c91b9f395b9f373739d501c66f8

FROM ghcr.io/renovatebot/renovate:${RENOVATE_VERSION} AS build

# Base image
#============
FROM ghcr.io/containerbase/base:14.5.2@sha256:6c5e127dad612a84a175d2ca469afb76c4dd7a05ffe4a185f207f3a11f81b9f5 AS base

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"
LABEL name="renovate"
# get changelog from renovate
LABEL org.opencontainers.image.source="https://github.com/renovatebot/renovate" \
  org.opencontainers.image.licenses="AGPL-3.0-only"

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 24.14.0

# renovate: datasource=npm
RUN install-tool pnpm 10.30.3

# renovate: datasource=dotnet-version packageName=dotnet-sdk
RUN install-tool dotnet 10.0.103


COPY --link --from=build --chown=root:root /usr/local/sbin/ /usr/local/sbin/
COPY --link --from=build --chown=root:root /usr/local/renovate/ /usr/local/renovate/


ARG RENOVATE_VERSION

LABEL org.opencontainers.image.version="${RENOVATE_VERSION}"

USER 12021
