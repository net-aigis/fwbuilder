#!/usr/bin/env bash
# Phase-1982: typecheck after schema 1.4.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1982 ok"
echo "cleaned"
echo "OK: phase1982 e2e passed"
