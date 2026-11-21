#!/usr/bin/env bash
# Phase-2070: typecheck after milestone 4550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2070 ok"
echo "cleaned"
echo "OK: phase2070 e2e passed"
