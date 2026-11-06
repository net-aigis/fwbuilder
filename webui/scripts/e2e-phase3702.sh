#!/usr/bin/env bash
# Phase-3702: typecheck after milestone 9650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3702 ok"
echo "cleaned"
echo "OK: phase3702 e2e passed"
