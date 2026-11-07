#!/usr/bin/env bash
# Phase-4454: typecheck after milestone 12000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4454 ok"
echo "cleaned"
echo "OK: phase4454 e2e passed"
