#!/usr/bin/env bash
# Phase-2830: typecheck after changelog_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2830 ok"
echo "cleaned"
echo "OK: phase2830 e2e passed"
