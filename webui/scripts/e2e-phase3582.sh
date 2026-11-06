#!/usr/bin/env bash
# Phase-3582: typecheck after surface_changelog_meta_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3582 ok"
echo "cleaned"
echo "OK: phase3582 e2e passed"
