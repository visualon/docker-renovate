FROM renovate/renovate:34.50.1-slim@sha256:fe8a462bd2aa5ec055b52c78938b4caaa85191b2b634ae9445f5531e831167b3

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.12.1

# renovate: datasource=npm
RUN install-tool corepack 0.15.2

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.100


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
