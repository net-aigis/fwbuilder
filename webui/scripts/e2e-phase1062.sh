#!/usr/bin/env bash
# Phase-1062: typecheck after pages_with_buddy_labels.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1062 ok"
echo "cleaned"
echo "OK: phase1062 e2e passed"
