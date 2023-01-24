FROM renovate/renovate:34.112.2-slim@sha256:e9fa00130d0a83e2ad6176d5e1562aef4bf341ffec03f0b38b8bc9f4fa527d6c

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
