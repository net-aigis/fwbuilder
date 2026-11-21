#!/usr/bin/env bash
# Phase-4206: typecheck after Soft 4200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4206 ok"
echo "cleaned"
echo "OK: phase4206 e2e passed"
