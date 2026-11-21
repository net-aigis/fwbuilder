#!/usr/bin/env bash
# Phase-276: buddy/tab CSS + sr-only for external-label controls.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'qt-buddy-label' webui/frontend/src/styles/app.css
grep -Fq 'sr-only' webui/frontend/src/styles/app.css
grep -Fq 'external-label' webui/frontend/src/styles/app.css
echo "buddy/tab CSS ok"
echo "cleaned"
echo "OK: phase276 e2e passed"
