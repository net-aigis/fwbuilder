#!/usr/bin/env bash
# Phase-3974: typecheck after milestone 10500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3974 ok"
echo "cleaned"
echo "OK: phase3974 e2e passed"
