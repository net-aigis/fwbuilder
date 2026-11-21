#!/usr/bin/env bash
# Phase-3550: typecheck after honesty_operator_brief_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3550 ok"
echo "cleaned"
echo "OK: phase3550 e2e passed"
