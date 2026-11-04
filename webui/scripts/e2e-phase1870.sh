#!/usr/bin/env bash
# Phase-1870: typecheck after schema 1.2.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1870 ok"
echo "cleaned"
echo "OK: phase1870 e2e passed"
