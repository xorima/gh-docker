FROM ubuntu:22.04

ARG VERSION=2.37.0
ARG ARCH=amd64
ENV GH_NO_UPDATE_NOTIFIER=1

RUN apt-get update && apt-get install curl -y \
    && curl -fsSL https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_${ARCH}.deb -o gh.deb \
    && apt-get install -y ./gh.deb \
    && rm gh.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "gh" ]
