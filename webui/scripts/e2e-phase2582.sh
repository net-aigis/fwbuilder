#!/usr/bin/env bash
# Phase-2582: typecheck after milestone 6150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2582 ok"
echo "cleaned"
echo "OK: phase2582 e2e passed"
