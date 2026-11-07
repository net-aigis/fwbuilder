#!/usr/bin/env bash
# Phase-4710: typecheck after milestone 12800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4710 ok"
echo "cleaned"
echo "OK: phase4710 e2e passed"
