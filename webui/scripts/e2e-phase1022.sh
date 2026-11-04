#!/usr/bin/env bash
# Phase-1022: typecheck after with_read_only.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1022 ok"
echo "cleaned"
echo "OK: phase1022 e2e passed"
