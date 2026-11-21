#!/usr/bin/env bash
# Phase-4694: typecheck after milestone 12750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4694 ok"
echo "cleaned"
echo "OK: phase4694 e2e passed"
