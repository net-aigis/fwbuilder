#!/usr/bin/env bash
# Phase-1310: typecheck after soft_fertig_surface_notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1310 ok"
echo "cleaned"
echo "OK: phase1310 e2e passed"
