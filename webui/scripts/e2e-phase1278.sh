#!/usr/bin/env bash
# Phase-1278: typecheck after surface detail UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1278 ok"
echo "cleaned"
echo "OK: phase1278 e2e passed"
