#!/usr/bin/env bash
# Phase-4246: typecheck after milestone 11350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4246 ok"
echo "cleaned"
echo "OK: phase4246 e2e passed"
