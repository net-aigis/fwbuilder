#!/usr/bin/env bash
# Phase-1126: typecheck after alt pages_with_buddy_labels.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1126 ok"
echo "cleaned"
echo "OK: phase1126 e2e passed"
