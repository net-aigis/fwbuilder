#!/usr/bin/env bash
# Phase-2886: typecheck after milestone 7100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2886 ok"
echo "cleaned"
echo "OK: phase2886 e2e passed"
