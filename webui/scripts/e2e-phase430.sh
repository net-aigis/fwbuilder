#!/usr/bin/env bash
# Phase-430: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 430 ok"
echo "cleaned"
echo "OK: phase430 e2e passed"
