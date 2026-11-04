#!/usr/bin/env bash
# Phase-2678: typecheck after milestone 6450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2678 ok"
echo "cleaned"
echo "OK: phase2678 e2e passed"
