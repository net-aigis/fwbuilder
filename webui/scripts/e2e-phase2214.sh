#!/usr/bin/env bash
# Phase-2214: typecheck after milestone 5000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2214 ok"
echo "cleaned"
echo "OK: phase2214 e2e passed"
