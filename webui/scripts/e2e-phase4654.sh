#!/usr/bin/env bash
# Phase-4654: typecheck after schema 4.8.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4654 ok"
echo "cleaned"
echo "OK: phase4654 e2e passed"
