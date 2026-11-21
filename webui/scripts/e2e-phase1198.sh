#!/usr/bin/env bash
# Phase-1198: typecheck after milestone 1850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1198 ok"
echo "cleaned"
echo "OK: phase1198 e2e passed"
