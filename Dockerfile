FROM renovate/renovate:34.83.1-slim@sha256:348fa64aaa3849d712e800eb64d2b3e55c1f698c4d65ca9b8c8caeaaa8840b9f

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.12.1

# renovate: datasource=npm
RUN install-tool corepack 0.15.3

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.101


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
