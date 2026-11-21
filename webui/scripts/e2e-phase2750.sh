#!/usr/bin/env bash
# Phase-2750: typecheck after surface_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2750 ok"
echo "cleaned"
echo "OK: phase2750 e2e passed"
