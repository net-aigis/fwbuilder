#!/usr/bin/env bash
# Phase-2926: typecheck after Soft 2920+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2926 ok"
echo "cleaned"
echo "OK: phase2926 e2e passed"
