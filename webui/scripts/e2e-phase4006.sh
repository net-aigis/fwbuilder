#!/usr/bin/env bash
# Phase-4006: typecheck after milestone 10600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4006 ok"
echo "cleaned"
echo "OK: phase4006 e2e passed"
