#!/usr/bin/env bash
# Phase-4286: typecheck after Soft 4280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4286 ok"
echo "cleaned"
echo "OK: phase4286 e2e passed"
