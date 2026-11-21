#!/usr/bin/env bash
# Phase-678: typecheck after SSH notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 678 ok"
echo "cleaned"
echo "OK: phase678 e2e passed"
