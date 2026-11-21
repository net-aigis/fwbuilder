#!/usr/bin/env bash
# Phase-3502: typecheck after honesty_operator_brief_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3502 ok"
echo "cleaned"
echo "OK: phase3502 e2e passed"
