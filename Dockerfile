FROM renovate/renovate:34.55.0-slim@sha256:37513ae6c4aaa69254567f3954d9c2f6d6c9aff4742a4d1f95c597cac4c41f46

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
