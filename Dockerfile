FROM renovate/renovate:34.70.0-slim@sha256:94f86c31c9a08f051a6a6ec1b07103e4635a508295a7d52cacd790b8068eae65

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.12.1

# renovate: datasource=npm
RUN install-tool corepack 0.15.2

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.101


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
