FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    openssh-client \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    gcc \
    g++ \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv

RUN python3 -m venv /opt/venv \
 && chown -R node:node /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --upgrade pip setuptools wheel
RUN pip install opencv-python-headless

RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g pnpm@9

RUN mkdir -p /workspace/node_modules /home/node/.pnpm-store \
    && chown -R node:node /workspace/node_modules /home/node/.pnpm-store

WORKDIR /workspace

CMD ["sh", "-c", "while sleep 1000; do :; done"]