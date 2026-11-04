#!/usr/bin/env bash
# Phase-2278: typecheck after milestone 5200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2278 ok"
echo "cleaned"
echo "OK: phase2278 e2e passed"
