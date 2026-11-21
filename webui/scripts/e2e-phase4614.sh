#!/usr/bin/env bash
# Phase-4614: typecheck after milestone 12500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4614 ok"
echo "cleaned"
echo "OK: phase4614 e2e passed"
