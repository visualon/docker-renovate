FROM renovate/renovate:34.157.0-slim@sha256:3172acb5cf875f22d738c0608354b7a3735e9fda94a7289b247f878fb69d4c65

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
