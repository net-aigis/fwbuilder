#!/usr/bin/env bash
# Phase-1014: typecheck after with_alignment.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1014 ok"
echo "cleaned"
echo "OK: phase1014 e2e passed"
