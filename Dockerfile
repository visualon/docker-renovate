FROM renovate/renovate:34.154.3-slim@sha256:7bc57f3d838ffe54955a093b57d126d5979b77a37e034b37f1bfe1ee0da5d78b

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.14.2

# renovate: datasource=npm
RUN install-tool corepack 0.17.0

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.201


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
