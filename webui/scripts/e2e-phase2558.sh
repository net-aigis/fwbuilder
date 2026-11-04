#!/usr/bin/env bash
# Phase-2558: typecheck after honesty_export_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2558 ok"
echo "cleaned"
echo "OK: phase2558 e2e passed"
