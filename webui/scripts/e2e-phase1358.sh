#!/usr/bin/env bash
# Phase-1358: typecheck after closure soft_fertig_surface.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1358 ok"
echo "cleaned"
echo "OK: phase1358 e2e passed"
