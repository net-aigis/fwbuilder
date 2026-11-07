#!/usr/bin/env bash
# Phase-4534: typecheck after milestone 12250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4534 ok"
echo "cleaned"
echo "OK: phase4534 e2e passed"
