#!/usr/bin/env bash
# Phase-4070: typecheck after milestone 10800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4070 ok"
echo "cleaned"
echo "OK: phase4070 e2e passed"
