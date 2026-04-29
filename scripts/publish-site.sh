#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$HOME/my-landings"

cd "$REPO_DIR"

git status --short

git add sites index.html robots.txt .nojekyll templates scripts || true

if git diff --cached --quiet; then
  echo "No changes to publish"
  exit 0
fi

git commit -m "Publish landing update"
git push origin main

echo "Published"
