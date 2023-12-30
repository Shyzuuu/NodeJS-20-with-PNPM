FROM ghcr.io/parkervcp/yolks:nodejs_20

RUN npm install -g pnpm --user=root

RUN pnpm --version
