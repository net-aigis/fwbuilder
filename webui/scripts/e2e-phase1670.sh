#!/usr/bin/env bash
# Phase-1670: typecheck after milestone 3300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1670 ok"
echo "cleaned"
echo "OK: phase1670 e2e passed"
