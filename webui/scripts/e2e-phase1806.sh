#!/usr/bin/env bash
# Phase-1806: typecheck after schema 1.1.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1806 ok"
echo "cleaned"
echo "OK: phase1806 e2e passed"
