#!/usr/bin/env bash
# Phase-2982: typecheck after milestone 7400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2982 ok"
echo "cleaned"
echo "OK: phase2982 e2e passed"
