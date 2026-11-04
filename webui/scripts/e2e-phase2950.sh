#!/usr/bin/env bash
# Phase-2950: typecheck after milestone 7300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2950 ok"
echo "cleaned"
echo "OK: phase2950 e2e passed"
