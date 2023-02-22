FROM renovate/renovate:34.150.0-slim@sha256:80ac69a3ea88b3cff2d29b03c5c57924a17078b0c3c9f99fe9fc82729cfbe834

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
