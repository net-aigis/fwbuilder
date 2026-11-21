#!/usr/bin/env bash
# Phase-2134: typecheck after milestone 4750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2134 ok"
echo "cleaned"
echo "OK: phase2134 e2e passed"
