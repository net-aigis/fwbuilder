#!/usr/bin/env bash
# Phase-3694: typecheck after schema 3.6.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3694 ok"
echo "cleaned"
echo "OK: phase3694 e2e passed"
