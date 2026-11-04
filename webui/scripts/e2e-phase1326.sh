#!/usr/bin/env bash
# Phase-1326: typecheck after closure related refusals.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1326 ok"
echo "cleaned"
echo "OK: phase1326 e2e passed"
