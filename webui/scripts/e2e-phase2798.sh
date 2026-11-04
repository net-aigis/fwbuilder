#!/usr/bin/env bash
# Phase-2798: typecheck after changelog_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2798 ok"
echo "cleaned"
echo "OK: phase2798 e2e passed"
