FROM renovate/renovate:34.47.2-slim@sha256:0d8e29b75c08a96ac6dad9e247fb552b4b85d4fb97f25784d200b9f357cf49b0

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
