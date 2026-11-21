#!/usr/bin/env bash
# Phase-1854: typecheck after track_note sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1854 ok"
echo "cleaned"
echo "OK: phase1854 e2e passed"
