FROM ghcr.io/parkervcp/yolks:nodejs_20

# Fix Perms Issue
USER root
RUN npm install -g pnpm

USER container

RUN pnpm --version
