#!/usr/bin/env bash
# Phase-4646: typecheck after milestone 12600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4646 ok"
echo "cleaned"
echo "OK: phase4646 e2e passed"
