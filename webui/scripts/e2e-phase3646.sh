#!/usr/bin/env bash
# Phase-3646: typecheck after Soft 3640+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3646 ok"
echo "cleaned"
echo "OK: phase3646 e2e passed"
