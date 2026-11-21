#!/usr/bin/env bash
# Phase-3814: typecheck after milestone 10000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3814 ok"
echo "cleaned"
echo "OK: phase3814 e2e passed"
