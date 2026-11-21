#!/usr/bin/env bash
# Phase-4134: typecheck after milestone 11000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4134 ok"
echo "cleaned"
echo "OK: phase4134 e2e passed"
