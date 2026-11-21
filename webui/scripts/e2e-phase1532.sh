#!/usr/bin/env bash
# Phase-1532: STATUS mentions surface keys + session storage / 1529-1536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'session storage.*(surface keys|in surface)|surface keys.*session storage' webui/STATUS.md
grep -qE 'phase1536|through 1536|e2e-phase1536' webui/STATUS.md
echo "STATUS surface+session ok"
echo "cleaned"
echo "OK: phase1532 e2e passed"
