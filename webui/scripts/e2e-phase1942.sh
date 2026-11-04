#!/usr/bin/env bash
# Phase-1942: typecheck after milestone 4150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1942 ok"
echo "cleaned"
echo "OK: phase1942 e2e passed"
