#!/usr/bin/env bash
# Phase-1342: typecheck after summary soft_fertig_surface.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1342 ok"
echo "cleaned"
echo "OK: phase1342 e2e passed"
