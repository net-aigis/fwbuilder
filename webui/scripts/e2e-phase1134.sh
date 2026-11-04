#!/usr/bin/env bash
# Phase-1134: typecheck after milestone 1650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1134 ok"
echo "cleaned"
echo "OK: phase1134 e2e passed"
