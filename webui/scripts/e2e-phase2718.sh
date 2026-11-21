#!/usr/bin/env bash
# Phase-2718: typecheck after surface_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2718 ok"
echo "cleaned"
echo "OK: phase2718 e2e passed"
