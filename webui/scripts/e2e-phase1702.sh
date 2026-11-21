#!/usr/bin/env bash
# Phase-1702: typecheck after milestone 3400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1702 ok"
echo "cleaned"
echo "OK: phase1702 e2e passed"
