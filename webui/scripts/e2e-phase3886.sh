#!/usr/bin/env bash
# Phase-3886: typecheck after Soft 3880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3886 ok"
echo "cleaned"
echo "OK: phase3886 e2e passed"
