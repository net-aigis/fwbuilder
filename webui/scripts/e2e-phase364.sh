#!/usr/bin/env bash
# Phase-364: CSS for stack pages / empty sections.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq '.option-stack-pages' webui/frontend/src/styles/app.css
grep -Fq '.option-section-empty' webui/frontend/src/styles/app.css
echo "stack CSS ok"
echo "cleaned"
echo "OK: phase364 e2e passed"
