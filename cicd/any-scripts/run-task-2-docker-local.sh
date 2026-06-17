#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd "$REPO_ROOT/cicd/task-2"

echo "Building Task 2 Docker image..."
docker build -t task-2-cd-app .

echo "Running Task 2 Flask app in Docker..."
echo "Open http://127.0.0.1:5000 in your browser."
docker run --rm -p 5000:5000 task-2-cd-app
