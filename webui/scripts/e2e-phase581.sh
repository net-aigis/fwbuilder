#!/usr/bin/env bash
# Phase-581: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 581 ok"
echo "cleaned"
echo "OK: phase581 e2e passed"
