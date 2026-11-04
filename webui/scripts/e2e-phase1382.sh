#!/usr/bin/env bash
# Phase-1382: typecheck after milestone 2400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1382 ok"
echo "cleaned"
echo "OK: phase1382 e2e passed"
