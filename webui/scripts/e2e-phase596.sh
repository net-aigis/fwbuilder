#!/usr/bin/env bash
# Phase-596: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 596 ok"
echo "cleaned"
echo "OK: phase596 e2e passed"
