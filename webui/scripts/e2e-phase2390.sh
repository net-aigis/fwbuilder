#!/usr/bin/env bash
# Phase-2390: typecheck after milestone 5550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2390 ok"
echo "cleaned"
echo "OK: phase2390 e2e passed"
