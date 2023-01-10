FROM renovate/renovate:34.95.2-slim@sha256:be462440aba27967f2e9f416d7cdde68fe45ab49d32df1d5d5c66ced2bcc14bd

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.13.0

# renovate: datasource=npm
RUN install-tool corepack 0.15.3

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.101


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
