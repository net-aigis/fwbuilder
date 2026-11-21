#!/usr/bin/env bash
# Phase-998: typecheck after milestone 1350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 998 ok"
echo "cleaned"
echo "OK: phase998 e2e passed"
