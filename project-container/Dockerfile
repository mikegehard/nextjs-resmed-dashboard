FROM node:22-slim

USER root

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  git \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=appuser
RUN useradd -m $USERNAME

RUN mkdir -p /workspace && chown -R $USERNAME:$USERNAME /workspace

# Switch to non-root user
USER $USERNAME

WORKDIR /workspace

# Copy package files for dependency installation
COPY --chown=$USERNAME:$USERNAME package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application
COPY --chown=$USERNAME:$USERNAME . .
