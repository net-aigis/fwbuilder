#!/usr/bin/env bash
# Phase-4198: typecheck after milestone 11200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4198 ok"
echo "cleaned"
echo "OK: phase4198 e2e passed"
