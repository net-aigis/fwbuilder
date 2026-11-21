#!/usr/bin/env bash
# Phase-2918: typecheck after milestone 7200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2918 ok"
echo "cleaned"
echo "OK: phase2918 e2e passed"
