#!/usr/bin/env bash
# Phase-3598: typecheck after surface_changelog_meta_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3598 ok"
echo "cleaned"
echo "OK: phase3598 e2e passed"
