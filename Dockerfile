FROM renovate/renovate:34.119.5-slim@sha256:212624a42fcd788109b643e8daef5cdf30c12c1e3c20e5941346eefcbfec6e82

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

USER root

RUN prepare-tool java gradle

# renovate: datasource=node
RUN install-tool node 18.13.0

# renovate: datasource=npm
RUN install-tool corepack 0.15.3

# renovate: datasource=dotnet lookupName=dotnet-sdk
RUN install-tool dotnet 7.0.102


USER ${USER_ID}

# use install mode
ENV RENOVATE_BINARY_SOURCE=install
