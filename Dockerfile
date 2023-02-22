FROM renovate/renovate:34.149.0-slim@sha256:d8126f7c3d75f88b1f23aa0c0f6c04dc71d4eb15d8f199062f4444041a94d83d

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.14.2

# renovate: datasource=npm
RUN install-tool corepack 0.16.0

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.200


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
