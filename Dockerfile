FROM renovate/renovate:34.102.7-slim@sha256:50c8f49ca191504e3f71f18a891e9eb068b3f7cbcb1770a1e53291f7367d04a6

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.13.0

# renovate: datasource=npm
RUN install-tool corepack 0.15.3

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.102


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
