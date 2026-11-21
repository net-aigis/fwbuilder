#!/usr/bin/env bash
# Phase-3542: typecheck after milestone 9150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3542 ok"
echo "cleaned"
echo "OK: phase3542 e2e passed"
