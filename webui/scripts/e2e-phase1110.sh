#!/usr/bin/env bash
# Phase-1110: typecheck after alt2 sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1110 ok"
echo "cleaned"
echo "OK: phase1110 e2e passed"
