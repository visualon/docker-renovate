FROM renovate/renovate:34.152.2-slim@sha256:0c79f07a77fa1bdef720cd4707231bc2a407e015e3fbdf0619f2c80b15e19b3a

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
