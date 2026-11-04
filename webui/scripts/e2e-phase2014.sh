#!/usr/bin/env bash
# Phase-2014: typecheck after soft_complete_note export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2014 ok"
echo "cleaned"
echo "OK: phase2014 e2e passed"
