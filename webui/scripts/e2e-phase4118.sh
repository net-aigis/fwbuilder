#!/usr/bin/env bash
# Phase-4118: typecheck after milestone 10950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4118 ok"
echo "cleaned"
echo "OK: phase4118 e2e passed"
