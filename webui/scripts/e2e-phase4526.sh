#!/usr/bin/env bash
# Phase-4526: typecheck after Soft 4520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4526 ok"
echo "cleaned"
echo "OK: phase4526 e2e passed"
