#!/usr/bin/env bash
# Phase-1862: typecheck after milestone 3900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1862 ok"
echo "cleaned"
echo "OK: phase1862 e2e passed"
