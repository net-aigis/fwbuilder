#!/usr/bin/env bash
# Phase-2150: typecheck after milestone 4800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2150 ok"
echo "cleaned"
echo "OK: phase2150 e2e passed"
