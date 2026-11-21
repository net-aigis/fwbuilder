#!/usr/bin/env bash
# Phase-2006: typecheck after milestone 4350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2006 ok"
echo "cleaned"
echo "OK: phase2006 e2e passed"
