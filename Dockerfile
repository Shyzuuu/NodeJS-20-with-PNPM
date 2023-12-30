FROM ghcr.io/parkervcp/yolks:nodejs_20

RUN curl -fsSL https://get.pnpm.io/install.sh | sh -

RUN pnpm --version
