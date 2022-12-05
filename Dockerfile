FROM renovate/renovate:34.49.0-slim@sha256:f76cd687fe1ba09a528f077346377833c70f829deeb6d1eb70d43c1ba5411c9a

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
