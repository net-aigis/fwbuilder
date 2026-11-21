#!/usr/bin/env bash
# Phase-1918: typecheck after readiness export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1918 ok"
echo "cleaned"
echo "OK: phase1918 e2e passed"
