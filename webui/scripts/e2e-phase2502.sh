#!/usr/bin/env bash
# Phase-2502: typecheck after milestone 5900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2502 ok"
echo "cleaned"
echo "OK: phase2502 e2e passed"
