FROM renovate/renovate:34.152.5-slim@sha256:9f3e260adf60891a94b08a22df4e8dbf7c7fcc104d0a0c0f8ff390b2ae840b52

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.14.2

# renovate: datasource=npm
RUN install-tool corepack 0.16.0

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.201


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
