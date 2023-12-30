FROM ghcr.io/parkervcp/yolks:nodejs_20

RUN npm install -g pnpm

RUN pnpm --version
