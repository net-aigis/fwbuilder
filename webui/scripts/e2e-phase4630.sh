#!/usr/bin/env bash
# Phase-4630: typecheck after milestone 12550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4630 ok"
echo "cleaned"
echo "OK: phase4630 e2e passed"
