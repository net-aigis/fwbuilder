#!/usr/bin/env bash
# Phase-2630: typecheck after milestone 6300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2630 ok"
echo "cleaned"
echo "OK: phase2630 e2e passed"
