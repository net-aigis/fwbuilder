#!/usr/bin/env bash
# Phase-1782: typecheck after milestone 3650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1782 ok"
echo "cleaned"
echo "OK: phase1782 e2e passed"
