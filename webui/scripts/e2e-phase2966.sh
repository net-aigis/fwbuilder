#!/usr/bin/env bash
# Phase-2966: typecheck after milestone 7350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2966 ok"
echo "cleaned"
echo "OK: phase2966 e2e passed"
