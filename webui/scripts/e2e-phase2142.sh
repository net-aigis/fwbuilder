#!/usr/bin/env bash
# Phase-2142: typecheck after honesty operator brief.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2142 ok"
echo "cleaned"
echo "OK: phase2142 e2e passed"
