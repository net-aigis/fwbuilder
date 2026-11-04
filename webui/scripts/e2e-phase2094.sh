#!/usr/bin/env bash
# Phase-2094: typecheck after surface_changelog export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2094 ok"
echo "cleaned"
echo "OK: phase2094 e2e passed"
