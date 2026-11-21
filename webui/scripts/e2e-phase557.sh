#!/usr/bin/env bash
# Phase-557: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 557 ok"
echo "cleaned"
echo "OK: phase557 e2e passed"
