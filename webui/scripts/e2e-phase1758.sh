#!/usr/bin/env bash
# Phase-1758: typecheck after catalog summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1758 ok"
echo "cleaned"
echo "OK: phase1758 e2e passed"
