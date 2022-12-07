FROM renovate/renovate:34.50.3-slim@sha256:dcaae47c3f2ade088e6144a975797d4ed0ade3a34a9d406d7421d9c60aa9c4de

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.12.1

# renovate: datasource=npm
RUN install-tool corepack 0.15.2

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.100


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
