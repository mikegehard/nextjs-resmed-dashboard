#!/bin/bash
# CI loop check: validate environment and run quality checks
# Runs inside the devcontainer in CI — Docker is not available here
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

echo "Verifying environment..."

# Verify essential tools are available
for cmd in node npm tsc eslint prettier; do
  if ! command -v "$cmd" &> /dev/null; then
    echo "ERROR: $cmd not found"
    exit 1
  fi
done
echo "All required tools available."
echo

echo "Installing dependencies..."
npm ci
echo

echo "Running type check..."
npm run type-check
echo

echo "Running lint..."
npm run lint
echo

echo "CI checks passed."
