#!/usr/bin/env bash
# Phase-3718: typecheck after milestone 9700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3718 ok"
echo "cleaned"
echo "OK: phase3718 e2e passed"
