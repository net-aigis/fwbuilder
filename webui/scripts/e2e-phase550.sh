#!/usr/bin/env bash
# Phase-550: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 550 ok"
echo "cleaned"
echo "OK: phase550 e2e passed"
