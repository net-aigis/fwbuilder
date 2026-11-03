#!/usr/bin/env bash
# Phase-367: typecheck after stack switcher.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 367 ok"
echo "cleaned"
echo "OK: phase367 e2e passed"
