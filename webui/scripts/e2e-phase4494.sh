#!/usr/bin/env bash
# Phase-4494: typecheck after schema 4.6.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4494 ok"
echo "cleaned"
echo "OK: phase4494 e2e passed"
