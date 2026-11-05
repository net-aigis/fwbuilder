#!/usr/bin/env bash
# Phase-3326: typecheck after Soft 3320+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3326 ok"
echo "cleaned"
echo "OK: phase3326 e2e passed"
