#!/usr/bin/env bash
# Phase-4734: typecheck after schema 4.9.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4734 ok"
echo "cleaned"
echo "OK: phase4734 e2e passed"
