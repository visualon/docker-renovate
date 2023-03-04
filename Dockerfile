FROM renovate/renovate:34.154.7-slim@sha256:ddd6a2db305832c8f6a1b4a7ffde48b8eddf6baaaa4fc6077f45fb4bccb246cd

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
