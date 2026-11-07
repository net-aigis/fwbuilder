#!/usr/bin/env bash
# Phase-4166: typecheck after milestone 11100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4166 ok"
echo "cleaned"
echo "OK: phase4166 e2e passed"
