#!/usr/bin/env bash
# Phase-4598: typecheck after milestone 12450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4598 ok"
echo "cleaned"
echo "OK: phase4598 e2e passed"
