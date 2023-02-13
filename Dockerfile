FROM renovate/renovate:34.134.1-slim@sha256:cb5eb5efdc76de29cc1a0a06253ce9972ef6e6b40338e2e17966d07e96deaa3e

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
