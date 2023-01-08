FROM renovate/renovate:34.92.1-slim@sha256:f2374b8a43c19bb79e871369f5b0f046b2d12bda78af07f240c4997d8117cf2d

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
