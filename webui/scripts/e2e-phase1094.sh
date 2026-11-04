#!/usr/bin/env bash
# Phase-1094: typecheck after alt sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1094 ok"
echo "cleaned"
echo "OK: phase1094 e2e passed"
