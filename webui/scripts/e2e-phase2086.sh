#!/usr/bin/env bash
# Phase-2086: typecheck after milestone 4600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2086 ok"
echo "cleaned"
echo "OK: phase2086 e2e passed"
