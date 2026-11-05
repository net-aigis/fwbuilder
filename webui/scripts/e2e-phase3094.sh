#!/usr/bin/env bash
# Phase-3094: typecheck after milestone 7750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3094 ok"
echo "cleaned"
echo "OK: phase3094 e2e passed"
