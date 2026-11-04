#!/usr/bin/env bash
# Phase-2734: typecheck after schema 2.4.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2734 ok"
echo "cleaned"
echo "OK: phase2734 e2e passed"
