ARG RENOVATE_VERSION=43.43.3@sha256:8336cfa9199b64906b11814cc23ea445d4e41a791d65d7775163f65a51bac4bf

FROM ghcr.io/renovatebot/renovate:${RENOVATE_VERSION} AS build

# Base image
#============
FROM ghcr.io/containerbase/base:14.4.8@sha256:1377301027b0146ea42e588ea614ca554533032498031bff9e6adc7dac777089 AS base

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
