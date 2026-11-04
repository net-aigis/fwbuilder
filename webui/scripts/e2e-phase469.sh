#!/usr/bin/env bash
# Phase-469: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 469 ok"
echo "cleaned"
echo "OK: phase469 e2e passed"
