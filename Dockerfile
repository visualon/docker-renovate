FROM renovate/renovate:34.143.1-slim@sha256:8d6e4f0ba05a7c293a48ca953f990df830fb5b9d3e6b88d2619173845ca48baa

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.14.0

# renovate: datasource=npm
RUN install-tool corepack 0.15.3

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.200


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
