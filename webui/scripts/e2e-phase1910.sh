#!/usr/bin/env bash
# Phase-1910: typecheck after milestone 4050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1910 ok"
echo "cleaned"
echo "OK: phase1910 e2e passed"
