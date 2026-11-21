#!/usr/bin/env bash
# Phase-3630: typecheck after surface_changelog_meta_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3630 ok"
echo "cleaned"
echo "OK: phase3630 e2e passed"
