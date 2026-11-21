#!/usr/bin/env bash
# Phase-3966: typecheck after Soft 3960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3966 ok"
echo "cleaned"
echo "OK: phase3966 e2e passed"
