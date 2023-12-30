FROM        --platform=$TARGETOS/$TARGETARCH node:20-bullseye-slim

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping libnss3 tini \
            && useradd -m -d /home/container container

RUN         npm install npm@latest typescript ts-node @types/node --location=global

# Fix Perms Issue and install pnpm
USER root
RUN npm install -g pnpm

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

# Check if PNPM Work
RUN pnpm --version

STOPSIGNAL SIGINT

COPY        --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
