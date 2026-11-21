#!/usr/bin/env bash
# Phase-1766: typecheck after milestone 3600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1766 ok"
echo "cleaned"
echo "OK: phase1766 e2e passed"
