FROM renovate/renovate:34.123.0-slim@sha256:0e33ffaed9b7c8b8481ddf7e3fec297ad4c4cb9486e122e77043312d1fa95308

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.14.0

# renovate: datasource=npm
RUN install-tool corepack 0.15.3

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.102


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
