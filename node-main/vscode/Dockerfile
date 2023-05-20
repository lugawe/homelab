FROM lscr.io/linuxserver/code-server:latest

RUN apt update && apt install -y ca-certificates curl gnupg build-essential python3 git
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && apt install -y nodejs
RUN corepack enable && corepack prepare yarn@stable --activate
