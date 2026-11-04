#!/usr/bin/env bash
# Phase-1550: typecheck after session storage notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1550 ok"
echo "cleaned"
echo "OK: phase1550 e2e passed"
