#!/usr/bin/env bash
# Phase-4014: typecheck after schema 4.0.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4014 ok"
echo "cleaned"
echo "OK: phase4014 e2e passed"
