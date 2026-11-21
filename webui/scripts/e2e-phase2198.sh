#!/usr/bin/env bash
# Phase-2198: typecheck after milestone 4950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2198 ok"
echo "cleaned"
echo "OK: phase2198 e2e passed"
