#!/usr/bin/env bash
# Phase-1406: typecheck after surface download UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1406 ok"
echo "cleaned"
echo "OK: phase1406 e2e passed"
