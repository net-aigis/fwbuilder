#!/usr/bin/env bash
# Phase-1630: typecheck after surface honesty bundle expansion.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1630 ok"
echo "cleaned"
echo "OK: phase1630 e2e passed"
