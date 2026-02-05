# Environment-only container for Next.js/Node.js development
# App source is mounted at runtime; dependencies installed via check scripts
FROM node:22-slim

USER root

ARG USERNAME=appuser

# Install system packages needed for development
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  git \
  jq \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install global dev tools (must be root for global npm install)
RUN npm install -g typescript eslint prettier

# Create non-root user
RUN useradd -m $USERNAME && \
  mkdir -p /workspace && \
  chown -R $USERNAME:$USERNAME /workspace

USER $USERNAME
WORKDIR /workspace
