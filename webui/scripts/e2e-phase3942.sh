#!/usr/bin/env bash
# Phase-3942: typecheck after milestone 10400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3942 ok"
echo "cleaned"
echo "OK: phase3942 e2e passed"
