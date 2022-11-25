FROM renovate/renovate:34.34.0-slim@sha256:20484f2389994811ccd08c83ec8b440f3c6c531865f149c51abb84fb6099aba4

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>"

# USER root
# RUN prepare-tool dotnet

# USER ${USER_ID}

# # renovate: datasource=node
# RUN install-tool node 18.12.1

# renovate: datasource=npm
RUN install-tool corepack 0.15.1
