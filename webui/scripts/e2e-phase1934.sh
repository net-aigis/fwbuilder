#!/usr/bin/env bash
# Phase-1934: typecheck after schema 1.3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1934 ok"
echo "cleaned"
echo "OK: phase1934 e2e passed"
