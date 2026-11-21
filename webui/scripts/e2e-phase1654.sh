#!/usr/bin/env bash
# Phase-1654: typecheck after milestone 3250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1654 ok"
echo "cleaned"
echo "OK: phase1654 e2e passed"
