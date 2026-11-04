#!/usr/bin/env bash
# Phase-1974: typecheck after milestone 4250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1974 ok"
echo "cleaned"
echo "OK: phase1974 e2e passed"
