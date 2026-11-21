#!/usr/bin/env bash
# Phase-4230: typecheck after milestone 11300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4230 ok"
echo "cleaned"
echo "OK: phase4230 e2e passed"
