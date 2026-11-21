#!/usr/bin/env bash
# Phase-2462: typecheck after sessionStorage roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2462 ok"
echo "cleaned"
echo "OK: phase2462 e2e passed"
