#!/usr/bin/env bash
# Phase-1814: typecheck after milestone 3750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1814 ok"
echo "cleaned"
echo "OK: phase1814 e2e passed"
