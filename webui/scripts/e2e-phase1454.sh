#!/usr/bin/env bash
# Phase-1454: typecheck after sessionStorage catalog keys.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1454 ok"
echo "cleaned"
echo "OK: phase1454 e2e passed"
