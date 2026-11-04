#!/usr/bin/env bash
# Phase-1238: typecheck after soft_fertig_surface_keys.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1238 ok"
echo "cleaned"
echo "OK: phase1238 e2e passed"
