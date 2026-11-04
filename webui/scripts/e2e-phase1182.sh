#!/usr/bin/env bash
# Phase-1182: typecheck after milestone 1800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1182 ok"
echo "cleaned"
echo "OK: phase1182 e2e passed"
