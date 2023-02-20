FROM renovate/renovate:34.146.3-slim@sha256:64e15a93070a673c95c0f39444f7d15fc6e8a1a6bd70b2b895b663eb1d152955

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.14.1

# renovate: datasource=npm
RUN install-tool corepack 0.16.0

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.200


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
