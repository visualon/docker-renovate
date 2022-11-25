FROM renovate/renovate:34.35.1-slim@sha256:bd7a9711b481d27c3ba42a3a12a1461d71725cdd9158d76c4db703b0f75ef29c

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
