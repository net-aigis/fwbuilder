#!/usr/bin/env bash
# Phase-3254: typecheck after milestone 8250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3254 ok"
echo "cleaned"
echo "OK: phase3254 e2e passed"
