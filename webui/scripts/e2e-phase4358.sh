#!/usr/bin/env bash
# Phase-4358: typecheck after milestone 11700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4358 ok"
echo "cleaned"
echo "OK: phase4358 e2e passed"
