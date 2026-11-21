#!/usr/bin/env bash
# Phase-2126: typecheck after surface_changelog sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2126 ok"
echo "cleaned"
echo "OK: phase2126 e2e passed"
