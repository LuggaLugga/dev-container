FROM debian:stable-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        nodejs \
        npm \
        openssh-server \
        python3 \
        python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN curl -fsSL https://claude.ai/install.sh | bash

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]