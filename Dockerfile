FROM renovate/renovate:34.153.0-slim@sha256:a45a1410e5db9f6e5145ec7a62edd9077cd04a0dbc990104bb5a45bca18e1103

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
