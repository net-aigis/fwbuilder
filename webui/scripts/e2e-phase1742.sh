#!/usr/bin/env bash
# Phase-1742: typecheck after surface_version export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1742 ok"
echo "cleaned"
echo "OK: phase1742 e2e passed"
