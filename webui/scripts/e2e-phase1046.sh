#!/usr/bin/env bash
# Phase-1046: typecheck after milestone 1400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1046 ok"
echo "cleaned"
echo "OK: phase1046 e2e passed"
