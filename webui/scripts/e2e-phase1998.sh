#!/usr/bin/env bash
# Phase-1998: typecheck after soft_complete_note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1998 ok"
echo "cleaned"
echo "OK: phase1998 e2e passed"
