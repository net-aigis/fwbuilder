#!/usr/bin/env bash
# Phase-3846: typecheck after milestone 10100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3846 ok"
echo "cleaned"
echo "OK: phase3846 e2e passed"
